import { db } from "../firebase_setup/firebase"
import { collection, addDoc } from "firebase/firestore"; 

const handleSubmit = async (newsData) => {
    try {
        const docRef = await addDoc(collection(db, "news"), {
          id: newsData.id,
          name: newsData.name,
        });
        console.log("Document written with ID: ", docRef.id);
      } catch (e) {
        console.error("Error adding document: ", e);
      }
}

export default handleSubmit