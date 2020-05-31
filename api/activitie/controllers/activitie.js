'use strict';

/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/controllers.html#core-controllers)
 * to customize this controller
 */
const { parseMultipartData, sanitizeEntity } = require('strapi-utils');
const { sendNotification } = require('../../../config/functions/email')


module.exports = {

  updatePrices: async ctx => {
    const { Discount } = ctx.request.body
    let activities = await strapi.query('activitie').find()
    await activities.map(x => {
      x.Price = (x.Price * (100 - Discount)) / 100.0
      strapi.query('activitie').model.forge({ id: x.id }).save("Price", x.Price)
    })
    ctx.send(activities)
  },

  async create(ctx) {
    let entity;
    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      entity = await strapi.services.activitie.create(data, { files });
    } else {
      entity = await strapi.services.activitie.create(ctx.request.body);
    }
    //send the email
    sendNotification(ctx)
    return sanitizeEntity(entity, { model: strapi.models.activitie });
  },

};
