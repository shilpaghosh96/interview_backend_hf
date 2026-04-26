# Interview Feedback AI

An end-to-end AI-powered web app that analyzes mock interview recordings and provides structured, actionable feedback.

## Overview

Interview Feedback AI allows users to upload or record interview audio and receive:

- A full interview transcript
- Extracted interview question-answer pairs
- Strengths and weaknesses analysis
- Personalized recommendations for improvement
- Detailed Q/A-level feedback with pros and cons

The goal is to simulate a real interviewer’s feedback process and help candidates improve their interview performance.

## Architecture

### Frontend

- HTML
- CSS
- JavaScript
- Lightweight interface for recording/uploading audio and viewing feedback
- Served directly through the FastAPI backend

### Backend

- Python
- FastAPI
- Handles audio upload, transcription, transcript chunking, and AI analysis

### AI Pipeline

1. Audio is uploaded or recorded from the frontend.
2. The backend transcribes the audio using `faster-whisper`.
3. The transcript is split into smaller chunks for long interviews.
4. A local LLM through Ollama extracts interview Q/A pairs.
5. A second analysis step generates:
   - Strengths
   - Weaknesses
   - Recommendations
   - Detailed Q/A feedback

## Tech Stack

- Python
- FastAPI
- faster-whisper
- Ollama
- Local LLMs such as Llama 3
- HTML
- CSS
- JavaScript
- Uvicorn

## Deployment

- Backend: FastAPI app deployed on Hugging Face Spaces / Render
- Frontend: Static HTML/CSS/JavaScript served directly by FastAPI
- LLM: Runs locally using Ollama during development

## Key Features

- Upload interview audio
- Record interview audio from the browser
- Automatic speech-to-text transcription
- Long transcript chunking for 1–1.5 hour interviews
- Structured JSON-based AI feedback
- Strengths, weaknesses, and recommendations
- Detailed Q/A analysis with pros and cons
- Lightweight frontend with no separate frontend hosting required

## Challenges Solved

- Handling long audio files through transcript chunking and batching
- Improving reliability of local LLM JSON outputs
- Extracting meaningful Q/A pairs from messy interview transcripts
- Reducing hallucinated or placeholder outputs
- Debugging FastAPI, Whisper, and Ollama integration issues
- Serving frontend and backend from the same application

## How to Run Locally

### 1. Clone the repository

```bash
git clone <your-repo-link>
cd interview_backend_hf
