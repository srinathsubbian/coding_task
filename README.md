# Coding Task
Sample of flutter application with Clean Architecture and MVVM.

#  Clean Architecture with ViewModel .
We’ll create a functional reactive ViewModel using Darts Stream API.

# MVVM
Before we look at any code, we should get a basic understanding of MVVM (Model-View-ViewModel).

# Module Structure
There are 3 main modules to help separate the code. They are Data, Domain, and Application.

- **Data** contains Local Storage, APIs, Data objects (Request/Response object, DB objects), and the repository implementation.

- **Domain** contains UseCases, Domain Objects/Models (Pojos/Kotlin Data Classes), and Repository Interfaces

- **Presentation** contains UI, View Objects, Android components, etc. Can be split into separate modules itself if needed.

# Repository
- Bridge between Data layer and Domain layer
- Connects to data sources and returns mapped data
- Data sources include DB and Api.

# UseCase
- Responsible for connecting to repository to retrieve necessary data. Can either return a Flowable that will emit each update or a Single/Completable that finishes after result is retrieved.
- This is where the business logic takes place.
- Returns data downstream.
- Single use.
- Lives in Domain (No Android dependencies. Very testable).

# ViewModel
- Organizes data and holds View state.
- Talks to use cases.
- Does not know about the View.

# View
- Updates UI
- Knows about the ViewModel
- Observes changes to ViewModel.



