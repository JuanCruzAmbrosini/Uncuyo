import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyA0-KVA3xgFmVJ8Ha0CyFLbhVaZmlDTNEg",
  authDomain: "ejercicio3j.firebaseapp.com",
  projectId: "ejercicio3j",
  storageBucket: "ejercicio3j.firebasestorage.app",
  messagingSenderId: "446398611401",
  appId: "1:446398611401:web:fb94fb42fdb2606b1c3218",
  measurementId: "G-BVSEGB3GCH"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

export const db =getFirestore(app)