describe('jungle rails app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    
      cy.visit('http://localhost:3000/')

    })


    it("Should navigate to product page", () => {
      cy.get('.nav-link').first().click();
      cy.url().should('include','/categories/1');
      cy.wait(2000)
      cy.get(".products article").first().click();
      cy.url().should('include', '/products/6'); 
      cy.wait(3000)
      cy.get('.product-detail').should('contain','Swamp Root')
    });

   
})