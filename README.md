##### Terraform infrastruktur

###### I denne repoen har jeg insfrastrukturen for DevOps-exam applikasjonen min. Hver gang det pushes til github og travis kjører så lastes opp det en image til container registry og dette imaget plukkes opp av Cloud Run i GCP og man kan dermed kjøre denne applikasjonen direkte derifra. I tillegg har jeg laget variabel av feks logz_io tokenet mitt og status cake api nøkkelen som er kryptert og implementert som secure nøkler i travis. Disse kobles opp mot sine respektive sider når den kjører. 
