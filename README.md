# Users Service
🚧 ***This service and its documentation are currently under development.*** Its architecture, APIs, features, and implementation details may change as development progresses.

The Users Service is responsible for managing user-related functionality within the application. It handles user data and account-related operations, including user registration, authentication, login, and profile management. The service communicates with the API Gateway through NestJS TCP transport.

## Responsibilities
The Users Service is responsible for managing user-related data and operations, including:

- User registration
- Fetching user data, both individually and in groups
- Updating user data
- Deleting users

Authentication and authorization are handled by the API Gateway rather than the Users Service.

## Message Patterns 
The Users Service communicates with the API Gateway using NestJS TCP microservice transport.

The following message patterns define the operations that can be requested by other services.

- `usersLogin`</br>
  Authenticate a user.
- `usersRegister`</br>
  Create a new account.
- `usersGetProfile`</br>
  Fetch the authenticated user's own data.
- `usersGetAll`</br>
  Fetch a list of users.
- `usersGetDetail`</br>
  Fetch an individual user data.
- `usersUpdate`</br>
  Update the authenticated user's own data.
- `usersDeleteForAdmin`</br>
  Delete a user's data by ID - `ADMIN ONLY`
- `usersDelete`</br>
  Delete the authenticated user's own account.

### Design Note
Some message patterns could technically be merged. For example, `usersGetProfile` and `usersGetDetail` both retrieve user data, while `usersDelete` and `usersDeleteForAdmin` both delete a user.

They are kept as separate message patterns to distinguish self-service operations from administrative operations and to make the Users Service's logs easier to understand and trace.

For self-service operations, the user ID is obtained from the authenticated user's JWT. For operations targeting another user, such as administrative deletion or retrieving a user's details, the ID is provided by the request.
