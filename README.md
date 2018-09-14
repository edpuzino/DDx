# Pocket DDx
Pocket Differential Diagnosis Application

**Author**: Ashley Breunich, Ed Puzino, Hollie Thomas, Matt McQuain

**Version**: 1.0.0 (increment the patch/fix version number if you make more commits past your first submission)

## Overview
The purpose of this application is to aide medical students in the task of differential diagnosis, or the process of elimination in determining a medical diagnosis through sequential and purposeful questioning. 

## Getting Started
In order to use this application a user must have access to a secure database to store patient information. The user must be able to use an internet connection and web browser. 

## Architecture
This application was written in V.S Code version 1.27.0. This application was written in Javascript and the following modules were installed: Express(JS), PostgresSQl. 
The following libraries are accessed in the use of this application: Googlemaps via Google (a free web based API allowing access to google imagery and maps) Biodigital Human (a virtual three dimensional image library of human anatomy).

## Change Log
09-06-2018 1200 - application now pushed to Github for inital sharing. 

09-07-2018 2000 - application now has file structure, header and footer partials.

09-08-2018 2030 - application now has working server and is able to communciate between files in view folder. 

09-09-2018 2030 - application now has working diagnostic questions stored and accessed through a server. 

09-10-2018 2100 - application now has working datbase for storing user information. 


## Credits and Collaborations

Ashley Breunich - https://github.com/ashley-breunich 
Ed Puzino - https://github.com/edpuzino
Hollie Thomas - https://github.com/holliemaethomas
Matt McQuain - https://github.com/mattoattacko

International Journal of Sports Physical Therapy - ANTERIOR CRUCIATE LIGAMENT INJURY DIAGNOSIS AND MANAGEMENT IN A PEDIATRIC PATIENT: A CASE REPORT
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3537458/

Dr. Nabil Ebraheim - Tests For Examination of the Knee
https://www.youtube.com/watch?v=KTuHrOisVDk

International Journal of Sports Physical Therapy - ANTERIOR CRUCIATE LIGAMENT INJURY DIAGNOSIS AND MANAGEMENT IN A PEDIATRIC PATIENT: A CASE REPORT https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3537458/

Dr. Nabil Ebraheim - Tests For Examination of the Knee https://www.youtube.com/watch?v=KTuHrOisVDk

ACL Injuries: Diagnosis, Treatment, and Prevention https://www.meadjohnson.com/pediatrics/us-en/sites/hcp-usa/files/ACLInjuries_0_0.pdf

Normal Joint Range of Motion Study https://www.cdc.gov/ncbddd/jointrom/

Mayo Clinic: ACL Injury https://www.mayoclinic.org/diseases-conditions/acl-injury/diagnosis-treatment/drc-20350744

Physiotutors https://www.youtube.com/channel/UC_VQDInMfY5HoPn8w9OmuFw

Dr. Glass DPM: Ankle Sprain Injury Explained https://www.youtube.com/watch?v=_u5w856Yjvg

Matthew Hawkes: Lateral Ankle Sprain Treatment & Rehabilitaton Exercises Video https://www.youtube.com/watch?v=OD-p1mwqsH4

Lateral Epicondylitis: https://www.physio-pedia.com/Lateral_Epicondylitis

Mill's Test: https://www.physio-pedia.com/Mill%E2%80%99s_Test

Ankle Sprain: https://www.physio-pedia.com/Ankle_Sprain

## Clearly defined API endpoints with sample responses




## Clearly defined database schemas
*Patient Schema*
    patients
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      gender VARCHAR(255),
      birthdate VARCHAR(255),
      diagnosis VARCHAR(255),
      answers TEXT

  *Diagnosis Schema*
    CREATE TABLE IF NOT EXISTS
    diagnosis (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      image_url VARCHAR(255),
      description TEXT,
      keyword VARCHAR(255),
      treatment VARCHAR(255)
    );




