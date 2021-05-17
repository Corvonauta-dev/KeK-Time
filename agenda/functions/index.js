const functions = require("firebase-functions");
const admin =  require('firebase-admin');


admin.initializeApp();

const db = admin.firestore();


const sgMail =  require('@sendgrid/mail');

const API_KEY = 'y9CLRIHnSHKdHIjOztM0sQ';
const TEMPLATE_ID = 'd-a19b43c278ef46d6b29fcfc571d29c13';
sgMail.setApiKey(API_KEY);

exports.novoRegistro = functions.auth.user().onCreate(async user => {
    

    await db.collection('Usuario').doc(user.uid).set({email: user.email});

    // const msg = {
    //     to: user.email,
    //     from: 'corvonauta.dev@gmail.com',
    //     templateId: TEMPLATE_ID,
    //     dynamic_template_data: {
    //         subject: 'Boas vindas KeK Time',
    //         name: user.displayName,
            
    //     },

    // };
    // return sgMail.send(msg);

});

