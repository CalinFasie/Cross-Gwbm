# Cross-Gwbm
De aici luam fisierele cu tertii:/bhstapel/37/
Utilizator: h10239radg
Parola: herr10239
https://193.83.219.94/files-10239/
- sunt de tipul DEB* si KRE*


https://chatgpt.com/c/67b58bc4-a358-8006-bdff-4ce57c1e7e87
2025-02-20
- Scriptul 1 Script T-SQL pentru importul datelor XML
  - ImportXMLTerti pe bd GWBM  
  - importa tertii din mai multe fisiere xml descarcate de la Cross
  - ii scrie in tabela _Import_terti_xml
    
- Scriptul2 ImportTertiXml.ps1 se afla pe srv-sql:\E\ImportXML\
  - apeleaza Scriptul 1 (procedura [dbo].[ImportXMLTerti])

- Apoi se ruleaza import_TERTI pentru inserarea tertilor in Asis
