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
  it('can add an item to the cart', () => {
    cy.visit("/");
    cy.get(".products article").first().find('button').click({force: true});
    cy.contains('My Cart (1)');
  })
});