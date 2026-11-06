describe('Teste Web - Practice Form', () => {

  it('Deve preencher o formulario, anexar arquivo e fechar o pop-up', () => {
    const url = 'https://demoqa.com/automation-practice-form'
    cy.visit(url)

    cy.get('#firstName').type('Amanda')
    cy.get('#lastName').type('Vieira')
    cy.get('#userEmail').type('amanda.teste@exemplo.com')
    cy.get('#gender-radio-2').check({ force: true })
    cy.get('#userNumber').type('1199999999')
    cy.get('#uploadPicture').selectFile('cypress/fixtures/arquivo-teste.txt')

    cy.get('#submit').click()

    cy.contains('Thanks for submitting the form').should('be.visible')
    cy.get('#closeLargeModal').click({ force: true })
  })

})
