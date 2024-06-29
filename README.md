# Time and Frequency Domain Analysis of Recorded Voice Signal

This repository contains the MATLAB code and instructions for studying the time and frequency domain analysis of a recorded voice signal. The analysis includes capturing a voice signal, converting it to a `.wav` file, and performing various analyses and filtering operations to understand the phonetic details and the effects of low-pass and high-pass filtering.
The entire project report is in the .docx file in this repository . Please Download and View to see the frequency plots and the analysis and inference.
## Project Objectives

### Time Domain Analysis
1. **Visual Analysis of Phonetics**: Understand the visual representation of phonetic elements in the time domain.
2. **Effect of LPF Filtering**: Study the impact of low-pass filtering on the voice signal in the time domain.
3. **Effect of HPF Filtering**: Study the impact of high-pass filtering on the voice signal in the time domain.
4. **Segregate Voice and Unvoiced Parts**: Differentiate between voiced and unvoiced segments of the signal.

### Frequency Domain Analysis
1. **Visual Analysis of Frequency Details**: Understand the frequency components of the voice signal.
2. **Effect of LPF Filtering**: Study the impact of low-pass filtering on the voice signal in the frequency domain.
3. **Effect of HPF Filtering**: Study the impact of high-pass filtering on the voice signal in the frequency domain.
4. **Segregate Voice and Unvoiced Parts**: Differentiate between voiced and unvoiced segments in the frequency domain.

## Procedure

1. **Capture Voice Signal**: Record a 10-15 second segment of your voice.
2. **Convert to .wav Format**: Save the recorded signal as a `.wav` file in a designated folder.
3. **Read Audio File**: Use the `audioread` command in MATLAB to read the audio file, e.g., `[y, Fs] = audioread('your_voice.wav');`.
4. **Time Domain Analysis**: Analyze the time domain representation of the audio vector `y` using Discrete Time Fourier Transform (DTFT).
5. **Frequency Domain Analysis**: Analyze the frequency domain representation of the audio vector `y` using DTFT.
6. **Filtering**: Apply low-pass and high-pass filters to the audio signal and study their effects in both time and frequency domains.
7. **Phonetic Variation**: Explore phonetic variations using both time and frequency domain representations.



## Usage

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/yourusername/voice-analysis.git
    cd voice-analysis
    ```

2. **Record Voice Signal**:
    - Run `record_voice.m` to capture and save your voice signal.

3. **Perform Analysis**:
    - Run `code.m` for time domain analysis.
  
