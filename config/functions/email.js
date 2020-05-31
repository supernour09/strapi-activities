const sgMail = require("@sendgrid/mail");
require('dotenv').config()

module.exports = {


  //it is temp solution till strapi provider work back
  async sendNotification (ctx) {
    try {
      // Adding the ApiKey
      sgMail.setApiKey(process.env.SENDGRID_API_KEY);
      //Message content
      const msg = {
        to: process.env.SendToEmail,
        from: "nourtesting20@gmail.com",
        subject: "Nour Ahmed Task1 confirm",
        text: "Hope you like the code && Hope to hear from you soon",
        html: "<strong>Hope you like the code && Hope to hear from you soon </strong>",
      }
      sgMail.send(msg).then(() => {
        console.log('Message sent')
      }).catch((error) => {
        console.log(error.response.body)
      })
      console.log("email sent");
    } catch (err) {
      console.log(err.message);
      return err;
    }

  }




}
