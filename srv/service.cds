using { sap.capire.bookshop as my } from '../db/schema';

service AdminService @(path: '/admin'){
    entity Books as projection on my.Books;

    entity Authors as select from my.Authors;

    action confirm();
    action complete();
}

service AuthService @(path:'/auth'){
    entity Books as projection on my.Books;

    entity Authors as projection on my.Authors;
}

// annotate CustomerService.Books with
//     @restrict: [
//       {grant: 'READ', to: 'admin'},
//       // {grant: 'READ', to: 'authenticated-user', where: 'createdBy = $user' },
//       // {grant: 'UPDATE', to: 'authenticated-uyser', where: 'createdBy = $user' }
//     ];
