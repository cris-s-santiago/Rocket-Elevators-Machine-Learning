describe('Creating an intervention', () => {
    it('logging in as admin then creating an intervention', () => {
        cy.visit('http://localhost:3000/users/sign_in');

        cy.get('[id="user_email"]').type('admin@admin');

        cy.get('[id="user_password"]').type('123456');
        // cy.contains('Log in').click()

        cy.get('[id="new_user"]').submit();

        cy.visit('http://localhost:3000/interventions');

        cy.get('[id="intervention_customer_id"]').select('1');

        cy.get('[id="intervention_building_id"]').select('1');

        cy.get('[id="intervention_battery_id"]').select('1');

        cy.get('[id="intervention_employee_id"]').select('1');

        cy.get('[id="intervention_report"]').type('This is a really good test!');

        cy.get('[id="new_intervention"]').submit();
    })
})