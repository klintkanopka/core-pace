# core-pace
Repository for analysis of CORE SEL data. Note none of the data is retained in this repo.

- To get a sense for the flow, see main.R as it organizes the ancillary scripts.
- To replicate results, edit file_paths.R to point to your data directory and then run main.R
- ~~To replicate reports, knit the appropriate report. This requires LaTeX and stargazer.~~ Removed while repo is public.

# Files:

- **main.R** - Calls all helper scripts in order.
- **file_paths.R** - Contains filepaths to aid in organization and replication of results.
- **read_data.R** - Reads in data, builds a file of tests and a file of student information with associated school characteristics. Note that SEL data is housed in the *student* file.
- **demographics.R** - Creates table of demographics and mean academic indicators. Outputs a single .tex table.
- **mean_scores.R** - Creates table of mean SEL and SBAC scores, by cohort-year. Outputs a single .tex table.
- **cor_mat.R** - Creates tables of year-to-year SEL construct correlations. Outputs two .tex tables.
- **sbac_ela.R** - Matches students to Smarter Balanced ELA test scores and fits four initial panel models per SEL construct to the data. Outputs four .tex tables.
- **sbac_math.R** - Matches students to Smarter Balanced Math test scores and fits four initial panel models per SEL construct to the data. Outputs four .tex tables.
- **ela_gm.R**, **ela_sa.R**, **ela_se.R**, **ela_sm.R**, **math_gm.R**, **math_sa.R**, **math_se.R**, **math_sm.R** - Fits four panel models for a given construct-SBAC pair. Currently, robust standard errors are commented out both here and in the **sbac_ela.R** and **sbac_math.R** files. These are computationally intensive, especially for model specification 4.


# Changelog:

**2019.05.31**

- Made repo public and removed reports.
- Fit four models per SBAC-SEL construct pair. Note that robust SEs are still slow to compute. Additionally, computing robust SE for each model 4 requires >29Gb of memory.
- Added descriptive tables.
- Restructured code to output all tables as .tex files to avoid unnecessary repeat computation.

**2019.05.08**

- Added scripts and initial report.
- Fit four main models - note that the robust SEs are slow to compute.
- Subgroup analysis forthcoming.
