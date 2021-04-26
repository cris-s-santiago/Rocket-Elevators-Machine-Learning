describe('Elevator Media', () => {
    it('Getting a cat picture', () => {
        cy.visit('http://localhost:3000/');

        cy.contains('MEDIA').click();

        cy.get('#initial_select').select('Get A Random Cat Gif');

        cy.get('#gif_btn').click();

        cy.scrollTo('top')

        cy.get('.fs-36 > img').should('be.visible')
        
    })

    it('Getting an advice', () => {
        cy.visit('http://localhost:3000/');

        cy.contains('MEDIA').click();

        cy.get('#initial_select').select('Get An Advice');

        cy.get('#advice_btn').click();

        cy.scrollTo('top')

        // cy.get('.fs-36 > img').should('be.visible')
        cy.get('.fs-20').should('be.visible')
    })

    it('Getting the weather', () => {
        cy.visit('http://localhost:3000/');

        cy.contains('MEDIA').click();

        cy.get('#initial_select').select('Get The Weather');

        cy.get('#getWeather_city').type('Quebec');

        cy.get('#city_btn').click();

        cy.scrollTo('top')

        cy.get('.fw-600').should('be.visible')
    })

    it('Getting a chuck norris joke', () => {
        cy.visit('http://localhost:3000/');

        cy.contains('MEDIA').click();

        cy.get('#initial_select').select('Get A Chuck Norris Joke');

        cy.get('#joke_btn').click();

        cy.scrollTo('top')

        cy.get('.fs-18').should('be.visible')
    })
})