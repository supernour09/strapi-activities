module.exports = ({ env }) => ({
  // email: {
  //   provider: 'nodemailer',
  //   Nodemailer_Default_From	: "supernour09@gmail.com",
  //   Nodemailer_Default_Reply_To : "nourahmedabbas@gmail.com" ,
  //   Host :"smtp.gmail.com" ,
  //   Port : 465 ,
  //   Username : "supernour09@gmail.com",
  //   Password : "Nononour@09",
  //   Secure : true,
  //   Auth_Method: "SMTP"

  // }
  email: {
    provider: 'sendgrid',
    providerOptions: {
      apiKey: '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',
    },
    settings: {
      defaultFrom: 'nourtesting20@gmail.com',
      defaultReplyTo: 'nourtesting20@gmail.com',
    },
  },
});
