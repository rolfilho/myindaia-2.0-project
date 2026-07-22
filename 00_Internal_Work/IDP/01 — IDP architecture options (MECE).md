### Stack Architectures for PDF to JSON Extraction


| Extraction Methodology          | Primary Engine                | Best Use Case                                                 |
| ------------------------------- | ----------------------------- | ------------------------------------------------------------- |
| **1. End-to-End Multimodal**    | Vision-Language Models (VLMs) | Highly variable layouts; rapid prototyping.                   |
| **2. Two-Stage Pipeline**       | Code Parser + Text LLM        | Text-heavy documents; cost-sensitive operations.              |
| **3. Purpose-Built Spatial ML** | Non-generative Document AI    | Standardized business forms at high volume.                   |
| **4. Agentic Orchestration**    | Router + Multiple Parsers     | Complex documents with mixed elements (tables, text, charts). |
| **5. Pure Deterministic Rules** | Zonal OCR / Regex             | Fixed-layout templates with zero variation.                   |

### Detailed Stack Options

**1. End-to-End Multimodal (Pure VLM)**

* **Mechanism:** The raw PDF (as an image or native file) is passed directly to a Vision-Language Model alongside the target JSON schema. The model parses visual layout and structures the data simultaneously.
* **Tech Stack:** Gemini 1.5 Pro / GPT-4o APIs + Native Structured Outputs features.
* **Pros:** Zero custom parsing logic; handles nested tables and complex spatial relationships intuitively.
* **Cons:** High token cost; high latency; vulnerable to context window limits and hallucinations on massive documents.

**2. Two-Stage Pipeline (Parser + Text LLM)**

* **Mechanism:** A deterministic library flattens the PDF into raw text or Markdown. A text-only LLM then maps this unstructured string into the defined JSON schema.
* **Tech Stack:** PyMuPDF / pdfplumber (parsing) + Instructor / Pydantic AI / BAML (schema enforcement) + Text LLM (e.g., Llama 3, Claude Haiku).
* **Pros:** Predictable, lower inference costs; fast processing for standard, single-column text.
* **Cons:** Visual context (e.g., multi-column layouts, complex tables, merged cells) is frequently scrambled or lost during the initial text extraction step.

**3. Purpose-Built Spatial ML (Non-Generative AI)**

* **Mechanism:** Specialized neural networks trained specifically for document layout analysis and key-value extraction, bypassing generative models entirely.
* **Tech Stack:** Open-source models (LayoutLMv3, Donut) or Managed Services (AWS Textract, Google Document AI).
* **Pros:** Fast inference; highly accurate on predictable document types (e.g., invoices, W-2s, ID cards).
* **Cons:** Requires fine-tuning to adapt to new or highly customized JSON schemas; less adaptable to edge cases than generative LLMs.

**4. Agentic Orchestration (Hybrid AI)**

* **Mechanism:** An orchestrator agent evaluates the document page-by-page and routes specific sections to the optimal tool. It might pass standard text to deterministic code, route complex tables to a VLM, and merge the results into a single JSON.
* **Tech Stack:** LlamaParse Workflows / MinerU / Docling (routing and extraction) + XGrammar / Outlines (constrained decoding).
* **Pros:** Maximum accuracy for diverse, dense, and multimodal documents.
* **Cons:** Highest architectural complexity; difficult to predict execution time and API cost per page.

**5. Pure Deterministic Rules (Zero AI)**

* **Mechanism:** Hardcoded Python scripts use spatial coordinates (bounding boxes), layout matching, and traditional OCR to map specific areas of a page directly to JSON keys.
* **Tech Stack:** OpenCV + Tesseract + Python `re` (regex) + PyPDF2.
* **Pros:** Lowest operating cost; execution measured in milliseconds; strictly deterministic with zero hallucination risk.
* **Cons:** Highly brittle architecture; breaks immediately if the document layout shifts or a scan is misaligned, requiring continuous maintenance.
