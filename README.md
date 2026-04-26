# Interview Feedback AI

## Overview

Interview Feedback AI is an end-to-end AI-powered web application that analyzes mock interview recordings and generates structured, actionable feedback.

The system simulates a real interviewer by evaluating responses, identifying strengths and weaknesses, and providing targeted recommendations for improvement.

This project was built independently outside of coursework to solve a real problem: helping candidates practice and improve interview performance using AI.

---

## Features

- 🎤 Upload or record interview audio
- 📝 Automatic speech-to-text transcription
- 🔍 Extraction of interview Q/A pairs
- ✅ Strengths identification
- ⚠️ Weakness detection
- 🚀 Personalized recommendations
- 🧠 Detailed Q/A-level feedback with pros and cons
- 📊 Structured JSON-based output for reliability

---

## Architecture

### Frontend
- HTML, CSS, JavaScript
- Simple, lightweight UI
- Handles audio upload/recording and displays results
- Served directly by FastAPI (no separate hosting required)

### Backend
- Python + FastAPI
- Handles:
  - Audio ingestion
  - Transcription
  - Chunking
  - AI analysis

### AI Pipeline

1. Audio is uploaded or recorded
2. Transcription using `faster-whisper`
3. Transcript is split into chunks (for long interviews)
4. Local LLM (via Ollama) extracts Q/A pairs
5. Final evaluation step generates:
   - Strengths
   - Weaknesses
   - Recommendations
   - Detailed analysis

---

## Tech Stack

- Python
- FastAPI
- faster-whisper
- Ollama (local LLM)
- Llama 3 / Llama 3.1
- HTML / CSS / JavaScript
- Uvicorn

---

## Deployment

- **Backend:** FastAPI (deployed on Hugging Face Spaces / Render during testing)
- **Frontend:** Static files served via FastAPI
- **LLM:** Local via Ollama (no API cost)

---

## How I Use AI Agents in This Project

This project uses a **multi-step AI agent-style workflow**:

- **Agent 1 (Extraction Agent):**  
  Extracts structured Q/A pairs from raw transcripts

- **Agent 2 (Evaluation Agent):**  
  Analyzes responses to generate:
  - Strengths
  - Weaknesses
  - Recommendations
  - Detailed feedback

- **Orchestration Layer:**  
  Handles:
  - Transcript chunking
  - Batch processing
  - Output validation (strict JSON enforcement)
  - Error handling and retries

This modular pipeline ensures:
- Scalability for long interviews (1–1.5 hours)
- More reliable outputs compared to single-prompt approaches
- Better control over hallucinations and formatting

---

## Key Challenges Solved

- Handling long interview recordings efficiently
- Preventing LLM output truncation
- Ensuring strict JSON outputs from local models
- Extracting meaningful Q/A from noisy transcripts
- Debugging Whisper + Ollama + FastAPI integration
- Serving frontend and backend together seamlessly

---

## How to Run Locally

### 1. Clone the repo

```bash
git clone https://github.com/shilpaghosh96/interview_backend_hf.git
cd interview_backend_hf
```

## Install dependencies
pip install -r backend/requirements.txt

## Start Ollama
ollama run llama3.1:8b

## Run backend
uvicorn backend.app.main_assembly_ai:app --host 127.0.0.1 --port 8000 --reload

## Open the app
http://127.0.0.1:8000

## Example Output
{
  "strengths": [
    "Clear explanation of technical concepts",
    "Strong product-building mindset"
  ],
  "weaknesses": [
    "Incorrect explanation of cross-entropy loss",
    "Some answers lacked depth"
  ],
  "recommendations": [
    "Review key ML loss functions with examples",
    "Use structured answer format: definition → intuition → formula → example"
  ]
}

## Future Improvements
Speaker diarization (interviewer vs candidate)
Real-time feedback streaming
PDF report generation
Improved frontend UX
Cloud-based LLM fallback
Interview-type specific evaluation (behavioral vs technical)
