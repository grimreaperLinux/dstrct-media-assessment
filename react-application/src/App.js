import { useRef, useState } from 'react';
import handleSubmit from './handles/handlesubmit';
import './App.css';

function App() {
  const nameRef = useRef(null);
  const idRef = useRef(null);
  const [isLoading, setLoadingState] = useState(false);
  const [error, setError] = useState('');

  const Submit = async (e) => {
    e.preventDefault();

    if (!nameRef.current.value.trim() || !idRef.current.value.trim()) {
      setError('Both fields are required!!!'); 
      return; 
    }

    setError(''); 
    setLoadingState(true);

    try {
      await handleSubmit({ id: idRef.current.value, name: nameRef.current.value });
      nameRef.current.value = '';
      idRef.current.value = '';

      setLoadingState(false);

      window.alert('News data submitted successfully!'); 
    } catch (error) {
      setError('Error submitting news data.');
      setLoadingState(false);
    }
  };

  return (  
      <div className="form-container">
        <div className='center-container'>
          <h1>Enter the News Article</h1>
          <form onSubmit={Submit}>
            <div className="input-container">
              <div className='label-container'>
                <label htmlFor="name">Name:</label>
              </div>
              <input
                type="text"
                id="name"
                ref={nameRef}
              />
            </div>
            <div className="input-container">
              <div className='label-container'>
                <label htmlFor="id">ID:</label>
              </div>
              <input
                type="text"
                id="id"
                ref={idRef}
              />
            </div>
            {error && <div className="error-message">{error}</div>}
            <button type="submit" className="submit-button">
              {isLoading ? <b>Saving...</b>: <b>Submit</b>} 
            </button>
          </form>
        </div>
      </div>
  );
}

export default App;