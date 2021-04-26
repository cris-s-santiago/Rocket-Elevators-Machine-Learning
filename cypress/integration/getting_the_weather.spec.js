describe('Getting the weather', () => {
    it('Gets the weather for the city', () => {
        cy.visit('http://localhost:3000/react/weather')

        cy.get('[data-testid="cityInput"]').type('Quebec');

        cy.get('[data-testid="submitCity"]').click();

        cy.contains('Quebec');
    })
})