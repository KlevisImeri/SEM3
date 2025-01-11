What should be looked at:
> Test processes (Test overview)
> labs


### Git
`git log --graph --oneline --all`
`git branch`
`git checkout`
`git switch`
`git cherrypick`
`git rebase`
`git revert`
`git reset`
### Maven
`mvn compile` - compiles
`mvn verify` - compile to run the tests
`mvn install` - compile + JAR/WAR
`<build>` - how to compile, package, and process your project's source code
### Code Review
- Informal reviews: 
	- team members and leader
	- reviews less structured 
	- focus general quality, readability issues
- Walkthrough:
	- team member and author of code
	- author explains to other members
	- team members ask questions and provide feedback
- Technical Review:
	- involve experts 
	- experts prepared and rigorous 
	- more formal and structure 
	- documented
- Inspection:
	- external experts and moderators
	- well-prepared
	- formal
	- documented

It is based in `structured checklists`:
- [x] readability
- [ ] maintainability
- [x] security
- [ ] vulnerability
- [x] performance
- [ ] common patterns
- [ ] best practices
### Static analysis
The Static analysis techniques are categorized:
- Sample-based: basic static properties 
	(SpotBugs | ErrorProne)
	- Bad practice: random object created and used only once.
	- Correctness: null pointer dereference.
	- Vulnerability: exposing internal static state by storing a mutable object into a static field
	- Multithreaded correctness: synchronization on Boolean may lead to possible deadlock
	- Performance: invoking `toString()` on a string
	- Security: hardcoded constant database password
	- Dodgy code: useless assignment in return statement
- Interpretation-based: check dynamic properties 
	(Coverty | Infer | PolySpace)
	- Nullpointer reference
	- Out-of-bound indexing

`SonarCloud` is a code quality management platform:
	- coding recomandations
	- duplicate code
	- test coverage
	- code complexity
	- potential bugs
	- vulnerabilities 
	- dept
	Stored data in database
	reports and graphs
	IDE and CI integration

`Coverity` is the static analyser:
	detect dynamic features
	- resource leakage
	- null pointers
	- uninitialized data 
	- parallel execution problems

Efficient Use of Static Analysis Tools:
-Efficient Use of Static Analysis Tools:
- ***integrated*** to build process
- used ***from the start***
- ***configure***:
	- most critical bugs first
	- gradually expand
- must be ***handled*** with care:
	- false negative (no bugs found bust doesn't mean no bugs exits)
	- false positive (didn't found a real error)
	  - you ignore but need documentation






- Process Activity of improving the product by:
	- evaluating a product quality:
		- do they satisfy the requirements
		- detect defects
	- execute under specified conditions

- SUT
	- System Under test
- Test case
	- Inputs
	- Implementation conditions
		- setup environment
	- Expected results
	- Purpose
- Test suite  
	- set of test cases
	- to test an aspect 
- Test oracle  
	- source of truth (principle)
	- how to find the truth (method)
- Verdict
	- Final decisons:
		- pass
		- fail
		- error
		- inconclusive 

1. Test selection
	- what inputs 
2. Oracle problem
	- where reliable oracle
3. Exit criteria
	- when to stop 

Rigorous 

1. Technical Viewpoint:  
   - Automation: automation tools   
   - Frameworks: structured way  
2. Critical Thinking: **uncovering defects and improving test strategies**.  
   - Domain Knowledge: Understanding the industry, business processes, and user requirements is crucial for effective testing.  
   - **Curiosity:** curious mindset encourages testers to ask questions, explore different scenarios, and consider how users might interact with the software. 
4. **Management Viewpoint:**  
   - Time and Costs
   - **Risk Management:** helps prioritize testing efforts and allocate resources to areas with the highest potential impact.  
  
- Verification:
	- Building the right way
	- implementation of specification 
	- automation
- Validation:
	- Building the right thing (system)
	- is the specification correct
	- no automation subjective


- Planning and Control
	- map: strategy -> project:
		- objectives
		- objects, environment
		- resources, roles
		- schedules
	- test phases
		- Length of phase
		- Exit criteria
		- Measuring quality of testing
	- Risk-based Testing
- Analysis and Design
	- Delve into details
	- Analyze what can be tested and what can not
	- Design the test
- Implementation and Execution
- Evaluating Exit Criteria and Reporting
- Test closure
	- collect experience 
	- save reusable tests...

- Unit test:
	- Calling some methods + varying parameters
	- Mostly from test source code
	- Working in the IDE mostly
- Integration+ tests
	- Call + parameters are only a small part
	- Configuration and context are much bigger effort
	- Files, databases, containers, networking…
	- Lots of new failure modes

- Functional  
	- verifying
	- performs its specified functions correctly
	- functional requirements 
- Non-functional  
	- non-functional aspects: 
		- performance
		- usability
		- security 
		- reliability
- Regression 
	- ensure that:
		- new changes
		- updates
		- fixes 
	do not negatively impact existing functionality:
	- new feature doesn't regress the app

- Unit/Module  
	- functions
	- methods
	- classes
- Integration  
	- interactions 
	- interfaces
- System  
	- software application as a whole
- Acceptance  
	- validate
- Alpha and beta
	- acceptance test
	- real-world scenarios 
	- different audiences:
		- Alpha: internal users
		- Beta: external users

- Experience-based:
	- Ad hoc testing : just curiosity
	- Exploratory testing: predefined goals or areas to explore
- Specification-based:
	- Black box
	- Basic techniques:
		- Equivalence partitions, boundary values, use cases, user stories…
	- Advanced techniques:
		- Decision tables, combinatorial testing (n-wise)…
- Structure-based
	- White-box
	- Basic techniques:
		- Control-flow coverage (statement, decision…)
	- Advanced techniques:
		- C/DC, MC/DC
		- Data-flow testing
- Fault-bases:
	- Error guessing
		- Previous or typical faults
	- Mutation testing
		- Mutating the code
			Evaluating tests
		- Mutating the tests
			Creating new tests
- Probabilistic 



> Specification-based 
	• SUT: black box
	• Only specification known
	• Testing specified functionality
> Structure-based
	• SUT: white box
	• Inner structure known
	• Testing based on internal structure and behaviour



> Statement  
> Block  
     – A sequence of one or more consecutive executable statements containing no branches or function calls  
> Condition  
     – Logical expression without logical operators (Boolean operators like and, or, …)  
> Decision  
     – A logical expression consisting of one or more conditions combined by logical operators  
> Decision branch     
     – One possible outcome of a decision  
> Path  
	 – A sequence of events, e.g., executable statements, of a component typically from an entry point to an exit point.