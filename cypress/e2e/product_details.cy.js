describe('tests for jungle product page', () => {
  it('can visit the home page', () => {
    cy.visit('http://localhost:3000')
  })
  it("There are products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });
  it("There are 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });
  it("can click on a product and visit the product page", () => {
    cy.visit("/");
    cy.get(".products article").first().find('a').click();
    cy.url().should('include', '/products/');
    cy.get('h1').should('be.visible');
  });
})