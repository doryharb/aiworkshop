# ABL Business Entity Architecture Pattern

## Overview

The Business Entity pattern provides a standardized, maintainable approach to data access in OpenEdge ABL applications. It separates UI logic from database operations through a layered architecture that promotes reusability, testability, and consistency across the application.

## Architecture Layers

### 1. UI Layer (Windows/Forms)
- **Responsibility**: User interaction and presentation
- **Access**: Never directly accesses database tables
- **Communication**: Calls Business Entity methods with datasets

### 2. Business Entity Layer
- **Responsibility**: Data access, business rules, validation
- **Inheritance**: Extends `OpenEdge.BusinessLogic.BusinessEntity`
- **Management**: Instantiated through EntityFactory (singleton pattern)

### 3. Database Layer
- **Responsibility**: Persistent storage
- **Access**: Only through data-sources attached to business entities

## Key Components

### EntityFactory (Singleton Pattern)

**Purpose**: Centralized management of business entity lifecycle

**Pattern**:
```abl
CLASS business.EntityFactory:
    /* Singleton instance */
    VAR PRIVATE STATIC EntityFactory objInstance.
    
    /* Entity instances */
    VAR PRIVATE CustomerEntity objCustomerEntityInstance.
    
    /* Private constructor prevents direct instantiation */
    CONSTRUCTOR PRIVATE EntityFactory():
    END CONSTRUCTOR.
    
    /* Public factory method */
    METHOD PUBLIC STATIC EntityFactory GetInstance():
        IF objInstance = ? THEN
            objInstance = NEW EntityFactory().
        RETURN objInstance.
    END METHOD.
    
    /* Entity getters with lazy initialization */
    METHOD PUBLIC CustomerEntity GetCustomerEntity():
        IF objCustomerEntityInstance = ? THEN
            objCustomerEntityInstance = NEW CustomerEntity().
        RETURN objCustomerEntityInstance.
    END METHOD.
END CLASS.
```
