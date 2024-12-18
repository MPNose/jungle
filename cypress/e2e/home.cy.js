describe('tests for jungle home page', () => {
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
  
})