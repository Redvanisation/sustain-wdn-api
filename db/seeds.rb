# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Facilitator.create(name: 'admin', email: 'admin@email.com', password: 'password', admin: true)
Facilitator.create(name: 'test', email: 'test@test.com', password: 'password')
Facilitator.create(name: 'Namgyal', email: 'namgyal.touchstoneleaders@gmail.com', password: '123456')

User.create(name: 'user-1', email: 'user1@gmail.com', password: 'password', facilitator_id: 1)
User.create(name: 'user-2', email: 'user2@gmail.com', password: 'password', facilitator_id: 1)

Pathway.create(
  title: 'Computer Science',
  description: 'Computer Science is the study of computers and computational systems. Unlike electrical and computer engineers, computer scientists deal mostly with software and software systems; this includes their theory, design, development, and application.',
  responsibilities: 'Demonstrate exceptional analysis planning and coding skills., Contribute to all phases of the development lifecycle., Software development and deployment., Testing and bug fixing., Embedded software development., Web-based application development., Help gather requirements and make recommendations for product development., Work collaboratively with team and stakeholders to achieve shared goals., Commit to delivering products on time and on budget., Current product maintenance., Run reports and groom backlogs., Prioritize tasks to maximize resources and efficiency.',
  qualifications: 'Bachelor’s degree in computer science or related field, Additional certifications that demonstrate a commitment to further education preferred, Minimum 2 years experience as a computer scientist or other relevant role, Exceptional coding skills including SQL HTML and Javascript, Significant experience with databases, Familiarity with Agile, Experience gathering and decomposing requirements, Proven record of solution development and deployment, Familiarity with web-based application development, Experience with testing use case and user stories, Outstanding communication skills written and verbal, Highly organized and able to manage multiple projects simultaneously, Team-player mentality with a positive attitude, Keen attention to detail and solid analytical skills, Able to articulate complex abstract concepts concisely and effectively',
  salary: '$70,000 - $80,000',
  links: 'https://www.freecodecamp.org, https://www.w3schools.com, https://www.codecademy.com, https://www.indeed.com/jobs?q=Computer+Science+Internship&l=Boston%2C+MA&radius=50, https://www.bestmastersdegrees.com/lists/five-great-computer-science-websites-for-students',
  education_levels: 'High School',
  subjects: 'Science (Computer Science), Mathematics ',
  activities: 'Computer Activities, Clubs',
  soft_skills: 'Critical Thinker, Technically Skilled, Team Player',
  support_types: 'Scholarships, Loans'
)

Pathway.create(
  title: 'Nursing',
  description: 'Aspiring nurses can take a variety of different paths to achieve their professional goals. Registered nurses usually take one of three education paths listed below. Working or volunteering at nursing homes, hospitals, health care facilities, or homeless shelters is a great way to gain experience and boost your resume. For those interested in pediatrics, working with children is at a daycare facility or summer camp is a plus.',
  responsibilities: 'Registered nurses (RNs) provide and coordinate patient care, educate patients and the public about various health conditions, and provide advice and emotional support to patients and their families., Most registered nurses work as part of a team with physicians and other healthcare specialists., Some registered nurses oversee licensed practical nurses nursing assistants and home health aides., Registered nurses’ duties and titles often depend on where they work and the patients they work with., For example an oncology nurse works with cancer patients and a geriatric nurse works with elderly patients., Some registered nurses combine one or more areas of practice., For example a pediatric oncology nurse works with children and teens who have cancer.',
  qualifications: 'bachelor’s or assiciate degree in nursing or a diploma from an approved nursing program., Once that is completed graduates must take and pass the National Council Licensure Exam for Registered Nurses (NCLEX_RN) to receive their state licensure and begin working as a Registered Nurse.',
  salary: '$52,080 to $111,220',
  links: 'http://www.bristolcc.edu/learnatbristol/programsandcourses/degreesandcertificates/degreeprograms/nursing/rn-to-bsnprograms/, http://www.bristolcc.edu/learnatbristol/programsandcourses/degreesandcertificates/degreeprograms/nursing/diversitynursingscholarsprogram/, https://bristolcc.smartcatalogiq.com/2018-2019/Catalog/Certificates-Alphabetically/Medical-Assisting, https://www.umassd.edu/programs/nursing-bs/, https://www.ncsbn.org/nclex-application-and-registration.htm, https://www.southcoast.org/philanthropy/volunteer/, https://www.volunteersouthcoast.org , https://www.volunteermatch.org/search/index.jsp?l=New+Bedford%2C+MA%2C+USA, https://ymcasouthcoast.org/childcare/preschool/new-bedford-ymca-early-learning-center/, https://www.littlepeoplescollege.com , https://www.southcoast.org/locations/, https://www.caring.com/senior-living/nursing-homes/massachusetts/new-bedford',
  education_levels: 'College, Graduate School',
  subjects: 'Science, Biology',
  activities: 'Volunteer work, community service',
  soft_skills: 'Communication, adaptable, creative thinking, team player',
  support_types: 'Scholarships, Loans, Paid Internships, Work Study Opportunities, Transportation, Other Financial Support'
)

Pathway.create(
  title: 'Veterinarian',
  description: 'Veterinarians care for the health of animals and work to protect public health. They diagnose, treat, and research medical conditions and diseases of pets, livestock, and other animals. Working or volunteering at animal shelters and clinics are a great way to gain experience and boost your resume. ',

  responsibilities: 'Veterinarians care for the health of animals and work to protect public health., They diagnose - treat - and research medical conditions and diseases of pets livestock and other animals., Veterinarians treat the injuries and illnesses of pets and other animals with a variety of medical equipment, including surgical tools and x-ray and ultrasound machines., They provide treatment for animals that is similar to the services a physician provides to humans., Most veterinarians work full time, often working more than 40 hours per week., Some work nights or weekends, and they may have to respond to emergencies outside of scheduled work hours.',

  qualifications: 'complete a Doctor of Veterinary Medicine (DVM or VMD) degree at an accredited college of veterinary medicine., Most applicants to veterinary school have a bachelor’s degree; typically in chemistry - physics - biochemistry - biology - animal - biology or zoology., Veterinary medical colleges typically require applicants to have taken many science classes including biology - chemistry and animal science., Most programs also require math - humanities and social science courses., Veterinarians must be licensed in order to practice in the United States., Licensing requirements vary by state but prospective veterinarians in all states must complete an accredited veterinary program and pass the North American Veterinary Licensing Examination.',

  salary: '$73,580 to $122,180',
  links: 'https://bristolcc.smartcatalogiq.com/en/2016-2017/Catalog/Programs-of-Study/Veterinary-Health-Care, https://www.umassd.edu/programs/chemistry/, https://www.umassd.edu/programs/biochemistry, https://www.umassd.edu/programs/physics/, https://www.umassd.edu/programs/biology/, https://vet.tufts.edu, https://all-veterinary-schools.com/veterinary-schools/, https://www.icva.net/navle/, https://www.southcoast.org/philanthropy/volunteer/, https://www.volunteersouthcoast.org, https://www.volunteermatch.org/search/index.jsp?l=New+Bedford%2C+MA%2C+USA, https://www.lighthouseanimalshelter.org/volunteer, https://www.foreverpaws.com/volunteer, https://www.caresouthcoast.com, http://www.newbedfordveterinaryhospital.com, https://www.newenglandanimalhosp.com, https://www.yelp.com/search?cflt=vet&find_loc=New+Bedford%2C+ma',
  education_levels: 'Graduate School',
  subjects: 'Science, Biology',
  activities: 'Volunteer work, community service',
  soft_skills: 'adaptable, creative thinking, team player',
  support_types: ''
)

Pathway.create(
  title: 'Human Resources Manager',
  description: 'Human resource managers are responsible for ensuring that the overall administration, coordination, and evaluation of a company’s human resources plans and programs are realized. Sustainable Company.',
  responsibilities: 'Implements employee benefits programs and informs employees of benefits by studying and assessing benefit needs and trends; recommending benefit programs to management; directing the processing of benefit claims; obtaining and evaluating benefit contract bids; awarding benefit contracts to employees., Ensures legal compliance by monitoring and implementing applicable human resource federal and state requirements conducting investigations maintaining records and representing the organization at hearings., Enforces management guidelines by preparing updating and recommending human resource policies and procedures., Retains historical human resource records by designing a filing and retrieval system to keep past and current records., Manages human resource staff by recruiting selecting - orienting and training employees., Improves human resource staff job results by counseling and disciplining employees; and planning - monitoring and appraising job results.',
  qualifications: 'Experience in the field of Human Resources normally 5+ years., Bachelors of Science/Bachelors of Arts in Human Resource Management - Management with a concentration in HR or Sustainability., Bachelors of Business administration with a concentration in one of the following: Human resources - Organizational Behavior - Management., Optional: Society of Human Resource Management: SHRM-CP (Certified Professional) - SHRM-SCP (Senior Certified Professional).',
  salary: '$68,000 - $90,000',
  links: 'https://business.unl.edu/academic-programs/departments/management/',
  education_levels: 'College',
  subjects: 'Science (Psychology), English (Literature/Analysis), English (Writing)',
  activities: 'Volunteer Work and Community Service, Clubs',
  soft_skills: 'Interpersonally Skilled (Good With Communications), ',
  support_types: ''
)

Pathway.create(
  title: 'Project Manager',
  description: 'Project managers oversee the construction of the renewable energy plant from site selection to the final installation of turbines. They coordinate the construction of a project, directing and coordinating activities ensuring that the project is complete on schedule and within budget. Project managers are also involved with the contractual bidding of projects and business development for the company as a whole. 
  The Project Manager leads and manages complex design-build energy projects, which includes project development, preconstruction services, and construction of design-build energy contracts. The Project Manager also performs a wide range of administrative and project support activities for to facilitate the efficient operation of the organization.',
  responsibilities: 'Schedule - coordinate - and lead group meetings., Attend and accurately document meetings., Document project decisions and action items., Distributing project information to the public., Filter relevant data for project databases., Assist with preliminary determinations of documents for response to FOIAs., Organize - update and maintain project records such as document files and contact lists., Prepare and modify project documents including correspondence - reports - plans - memos and emails., Prepare written responses to routine enquiries., Provide assistance with logistics of public - tribal and agency meetings., Conduct and compile research on projects - policy and stakeholder positions., Coordinate information relevant to project assignments from multiple sources., Finalizing project tasks., Interact with project clients on a direct daily basis.',
  qualifications: 'Proven success managing significant complex design-build energy projects., Demonstrated leadership skills and management know-how., Excellent interpersonal skills that establish and promote effective relationships with owners - engineers and subcontractors., Ability to balance and prioritize multiple complex tasks., Usually requires 10+ Years of experience in project Management.',
  salary: '$56,140 - $164,790',
  links: '',
  education_levels: 'High School, College, Graduate School',
  subjects: 'Mathematics (Statistics), English (Writing), Science (Psychology), Languages',
  activities: 'Volunteer Work and Community Service, Clubs, Activism, Leadership',
  soft_skills: 'Interpersonally Skilled (Good With Communications), Team Player, Critical Thinker',
  support_types: ''
)

Pathway.create(
  title: 'Project Coordinator',
  description: 'Project coordinators are an important part of an organization’s project team. They work under a project manager to ensure projects are completed on time and within budget. Project coordinators oversee small parts of the larger project and are primarily responsible for administrative tasks.
  Although the project manager is ultimately responsible for a company’s projects, the project coordinator makes sure all aspects of the project run smoothly and efficiently. Project coordinators work with various members of the project team and the client to develop a time line, create schedules, and oversee progress to make sure goals are met on time.
  Project coordinators utilize spreadsheets to track budgets, dates, and other information. They organize contracts, financial files, reports, and invoices, and perform administrative duties such as ordering office supplies, bookkeeping, and billing. These professionals are also responsible for coordinating and attending meetings and developing project strategies.',
  responsibilities: 'Coordinating project schedules - resources - equipment and information., Liaising with clients to identify and define project requirements scope and objectives., Ensuring that clients’ needs are met as the project evolves working closely with project manager to prepare comprehensive action plans including resources - timeframes and budgets for projects., Perform various coordinating tasks like schedule and risk management; along with administrative duties., Maintaining project documentation and handling financial queries.',
  qualifications: 'Being a project coordinator in any field requires a lot of problem-solving and multitasking. You’re coordinating multiple aspects of a project in a fast-paced and challenging work environment and communicating all the issues and risks of the project., 
  As a project coordinator your job is to make sure that everyone is on the same page and speaking the same language. Therefore it’s essential to have excellent organizational and communication skills. Because you are responsible for making sure your part of the project stays on target., 
  Successful project coordinators are self-motivated - attentive - and always follow through., High level of customer service., Ability to work effectively with other functional groups., Proficient in Excel., Analytical & critical thinking skills., Ability to understand and navigate different database systems., Ability to multi-task and be self-motivated., Strong organizational skills., Strong written and oral communication skills.',
  salary: '$58,390 - $83,591',
  links: '',
  education_levels: 'College, Graduate school',
  subjects: 'Languages, Science, Mathematics',
  activities: 'Volunteer Work and Community Service, Activism, Leadership',
  soft_skills: 'Critical Thinker, Team player, Adaptable, Interpersonally Skilled (Good With Communications)',
  support_types: 'Internships'
)

# Pathway.create(
#   title: '',
#   description: '',
#   responsibilities: '',
#   qualifications: '',
#   salary: '',
#   links: '',
#   education_levels: '',
#   subjects: '',
#   activities: '',
#   soft_skills: '',
#   support_types: ''
# )