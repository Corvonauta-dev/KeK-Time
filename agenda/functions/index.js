const functions = require("firebase-functions");
const admin =  require('firebase-admin');
admin.initializeApp();

const db = admin.firestore();

exports.onUserCreate = functions.firestore.document('Usuarios/{userId}').onCreate(async (snap, context) => {
    const values = snap.data();

    await db.collection('logging').add({ description: 'Email enviado para: ' + values.nome});
})
