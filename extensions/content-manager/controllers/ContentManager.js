'use strict';

const _ = require('lodash');

const parseMultipartBody = require('../utils/parse-multipart');

//the provider in strapi have problem so untill it is fixed we have to use direct method
const { sendNotification } = require('../../../config/functions/email')


module.exports = {

  //overwritteing the method used to create Activite from the Admin panel
  async create(ctx) {
    const contentManagerService = strapi.plugins['content-manager'].services.contentmanager;
    const { model } = ctx.params;

    try {
      if (ctx.is('multipart')) {
        const { data, files } = parseMultipartBody(ctx);
        ctx.body = await contentManagerService.create(data, { files, model });
      } else {
        // Create an entry using `queries` system
        ctx.body = await contentManagerService.create(ctx.request.body, { model });
      }

      //send the email
      sendNotification(ctx)

      await strapi.telemetry.send('didCreateFirstContentTypeEntry', { model });
    } catch (error) {
      strapi.log.error(error);
      ctx.badRequest(null, [
        {
          messages: [{ id: error.message, message: error.message, field: error.field }],
          errors: _.get(error, 'data.errors'),
        },
      ]);
    }
  },
}
