import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyCuNxH7X0VvpnL-ot0T0SB1f9_y_naI0Os",
  authDomain: "dstrct-server.firebaseapp.com",
  projectId: "dstrct-server",
  storageBucket: "dstrct-server.appspot.com",
  messagingSenderId: "893886916778",
  appId: "1:893886916778:web:4b5746c10b2fe84cefc8d3"
};

const app = initializeApp(firebaseConfig);

export const db = getFirestore(app);