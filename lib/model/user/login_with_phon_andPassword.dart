
/*
FirebaseFunctions.getInstance() // Optional region: .getInstance("europe-west1")
.getHttpsCallable("myCoolFunction")
.call(optionalObject)
.addOnFailureListener {
Log.wtf("FF", it)
}
.addOnSuccessListener {
toast(it.data.toString())
}

 */


/*
const functions = require('firebase-functions');
const firebase = require('firebase');
const admin = require('firebase-admin');

admin.initializeApp();
firebase.initializeApp({
//Add config for web-app here
//Required because Admin SDK doesn't include signInWithEmailAndPassword method
});

exports.signInWithPhoneAndPassword = functions.https.onCall(async (data, context) => {
const phoneNumber = data.phone;
if (phoneNumber === undefined) {
return {'s':400,'m':'Bad argument: no phone number'};
}
const user = await admin.auth().getUserByPhoneNumber(phoneNumber);
const pass = data.password;
try {
await firebase.auth().signInWithEmailAndPassword(user.email, pass);
} catch (e) {
return {'s':400,'m':'Wrong password'};
}
const token = await admin.auth().createCustomToken(user.uid, {'devClaim':true}); //developer claims, optional param
return {'s':200,'t':token};
});

 */
