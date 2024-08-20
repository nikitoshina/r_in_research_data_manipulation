# Homework

## 1. Conducting a Literature Review

After learning about various tools and resources for conducting a literature review, apply these techniques to a topic of your interest. If you're currently working on a specific topic, that would be ideal. If not, consider exploring the concept of economic complexity or another topic of interest. Here’s what you need to do:

1. Search for Papers:
   - Use [Elicit](https://elicit.org) and [Google Scholar](https://scholar.google.com) to search for relevant papers.
   - Add the papers you find to your [Zotero](https://www.zotero.org/) library.
  
2. Filter and Sort Papers:
   - Apply skimming techniques as described in the videos to filter and sort through the papers.
  
3. Expand Your Search:
   - Use [Research Rabbit](https://researchrabbitapp.com/home) to expand your paper search and discover additional relevant literature.
  
4. Read and Take Notes:
   - Read the top 10 papers you’ve identified.
   - Take detailed notes in Google Sheets.
   - Use ChatGPT to generate your first rough draft based on these notes.

For help setting up Zotero, check out this [YouTube tutorial](https://www.youtube.com/watch?v=tnbwKj6-pD8).

## 2. Creating a Quarto Document

Now that you have your rough draft in Google Sheets, it’s time to transfer your writing to a Quarto document. Here’s how to proceed:

1. Set Up Your Document:
   - Specify the title, author, and date in the YAML header.
   - Configure the document to produce both HTML and PDF outputs.
   - Use Quarto's referencing capabilities to integrate your Zotero library for citations.

2. Resources for Quarto:
   - If you feel stuck, refer to the [Official Quarto Guide](https://quarto.org/docs/guide/). It’s well worth reading from front to back. I personally refer to it whenever I’m working on a Quarto document.
   - For specifics on using Zotero with Quarto, check out the [Zotero Citations in Quarto Guide](https://quarto.org/docs/visual-editor/vscode/index.html#zotero-citations).

## 3. Finding and Preparing Data

With a rough draft and some understanding of your research topic, identify data sources to analyze:

1. Find Data Sources:
   - Download datasets relevant to your research.
   - If you’re unable to find suitable data, you can use the same datasets as those in the example paper.

2. Combine Datasets:
   - Practice joining data by combining all your datasets into a single cohesive dataset.
   - Explore how all main types joins work, such as left, right, full, and inner joins.

## 4. Performing Data Analysis

With your dataset ready, begin your analysis by calculating summary statistics and testing hypotheses:

1. Formulate Hypotheses:
   - Based on your understanding of the data, form some hypotheses and assumptions.
  
2. Compute and Transform:
   - Compute new columns and transform existing ones as needed.
   - Calculate summary statistics such as mean, median, and standard deviation for numeric columns.
   - For character or factor columns, get a count of the unique values.

## 5. Validating Your Assumptions

Lastly, validate your assumptions using appropriate data validation techniques:

1. Choose a Validation Tool:
   - Integrate data validation checks using base R, [Assertr](https://github.com/ropensci/assertr), and [Pointblank](https://github.com/rich-iannone/pointblank).
  
2. Evaluate and Compare:
   - Try out all three methods to see which one you prefer for validating your data assumptions.

