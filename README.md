# Epsilon

## Introduction

**EN**
```txt
This project was carried out as part of our studies. Its aim is to introduce the concept of TPAM (Third Party Application Maintenance) & AM (Application Maintenance).
We have to develop part of the application and then exchange it with another group who has to finish it.
```

**FR**
```txt
Ce projet est a été réalisé dans le cadre de nos études. Son objectif est d'introduire les concepts de TMA (Tierce Maintenance Applicative) et de MA (Maintenance Applicative). Nous devons développer une partie de l'application, puis la transférer à une autre équipe qui la finalisera.
```

## Database

### UML
Here's our UML, inspired by the one our teacher gave us. We've only extracted what's necessary.

![UML](./.git-image/schema.png)

### Functions
We made a function which for each user created (users tables in the supabase auth schema), will create their public profile (user table in the public schema).

![FUNCTION](./.git-image/func.png)

### Policies
*We have also added accessibility policies for some tables.*

#### Users

Each user has all rights for his account.

![USERS POLICIE](./.git-image/user_policie.png)

#### Modules

A person can only see modules that have an access level lower than or equal to their level

![MODULE POLICIE INSERT](./.git-image/module_policie_insert.png)

<br>
A person can create modules only if he is an admin or teacher.

![MODULE POLICIE SELECT](./.git-image/module_policie_select.png)
