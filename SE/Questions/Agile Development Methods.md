TARGET DECK: SEM3::SE::Agile_Development_Methods

In the kanban method do you pass the defective products? #flashcard 
NO, you don't pass them.
<!--ID: 1702657475754-->


How do you manage resources in Kanban? #flashcard 
- Take only what needed
- Produce the exact quantity required
<!--ID: 1702657475762-->


What to do in the Kanban method to make it better? #flashcard 
- level the production
- Fine-tune
- Stabilize/Rationalize (optimize)
<!--ID: 1702657475769-->



What are the components of the Kanban? #flashcard 
- Swimlane = Project || Category
	- Life Cycle
		- States
			- Work item
				- Checklist
				- Integration (testing)
				- Messages
<!--ID: 1702657475775-->


Give some Kanban examples? #flashcard 
- Trello
- Jira
- Miro
- Github
<!--ID: 1702657475783-->


What is the basic Philosophy of Scrum? #flashcard 
- Transparency
- Adaptation
- Observation / Inspection 
<!--ID: 1702657475789-->



What roles does scrum include? #flashcard 
- Participants:
	- Product Owner
	- Scrum Master
	- DevTeam <10
- Stakeholders:
	- Costumers 
	- Users
	- Management
	- Technical experts
<!--ID: 1702657475796-->



What are the steps of Scrum? #flashcard 
```java
Project project = new Project();
PO po = new PO();
DevTeam devTeam = new DevTeam();
while(productNotFinished){
	BacklogItems items = po.decompose(project);
	devTeam.select(items);
	SprintResults resutls = DevTeam.sprint();
	Project changedProject = Stakeholders.discuss(resutls);
	project = changedProject;
}
```
<!--ID: 1702657475804-->


What does Product Owner do? #flashcard 
- Strategy
- Roadmap
- Forecast Cost
- Performance
- PO <=Communicate=> ST
<!--ID: 1702657475811-->


What does Scrum Master do? #flashcard 
Help with social things:
- Support the team
- Supporting the work of the PO:
	- making it more human friendly for understanding
- Organisational tasks
<!--ID: 1702657475819-->

What is a squad? #flashcard 
- A single project team:
	- PO
	- SM
	- DEV
<!--ID: 1702657659422-->


What is a Chapter? #flashcard 
- People with the same function
<!--ID: 1702657659432-->


What is a Tribe? #flashcard 
- Several Squads
<!--ID: 1702657659438-->


What is a Guild? #flashcard 
- People with the same interest.
<!--ID: 1702657659446-->


What kind of meeting does scrum have? #flashcard 
- Standup:
	- what you done
	- what will you do
	- what obstacles
<!--ID: 1702658100348-->



What are the scrum ***events***? #flashcard 
- Sprint Planning : Sprint Backlog
- Daily Scrum 
- Sprint Review : inspect and plan`
- Sprint Retrospective : refine
<!--ID: 1702658100356-->



What are the possible backlogs in SCUM? #flashcard 
- Sprint Backlog : DevTeam
- Product Backlog : PO
The Sprint Backlog is a specific plan for the work to be done in a particular sprint, while the Product Backlog is a comprehensive list of all features and enhancements needed for the entire product. The Sprint Backlog is short-term and managed by the Development Team, while the Product Backlog is long-term and owned by the Product Owner.
<!--ID: 1702658100363-->

Explain the whole scrum process? #flashcard 
![](Pasted%20image%2020231215173600.png)
<!--ID: 1702658658597-->


How do you measure how hard(Complexity & Risk) a work item is to do in scrum?
What kind of series is used? #flashcard 
- Story Points
- ~Fibonacci
<!--ID: 1702658658606-->


What is the Burn-up chart? #flashcard 
- How much of the Story Points are burned up.
<!--ID: 1702658658613-->


If the Sprint has Started does Sprint Backlog change? #flashcard 
- NO it should not change 
<!--ID: 1702658658620-->

What does the product backlog estimate? 
What is the measure? #flashcard 
- User story
- release burndown
<!--ID: 1702660041628-->


Who accepts (as done) the sprint and where? #flashcard 
- Product Owner at sprint review
<!--ID: 1702660041636-->


What are the parts of Multi-level DoD #flashcard 
- User Story 
- Sprint 
- Release
<!--ID: 1702660041642-->



What to do when you start a project? #flashcard 
- A start meeting = Agile Inception Deck
- it has specified questions that need to be answered
<!--ID: 1702660041651-->



What is the Elevator Pitch? #flashcard 
- You need to express beautifully in 1 minute the intend.
<!--ID: 1702660041657-->


What is the Agile guide from the EU? #flashcard 
- $PM^2$
<!--ID: 1702660041667-->


What is Incremental Deployment? #flashcard 
- System is released in small, functional increments or pieces rather than as a whole.
<!--ID: 1702660041674-->


What is Acceptance Test? #flashcard 
- To ensure that the delivered product satisfies the criteria agreed upon with the stakeholders.
- Used for **validitaion**.
<!--ID: 1702662973264-->
