# Fusion360_ProShopERP_GCodeParsing
Insert the code from Fusion360_ProShopERP_GCodeParsing.cps at the end a Fusion 360 or HSM Post to output data that can be parsed by ProShop ERP to populate sequence details for a part operation.

Copy/Paste next line immediately after post properties:

var proshop = new proshopErp();
  
Copy/Paste next line anywhere in onOpen():

proshop.writeOpNumber();
  
Copy/Paste next line anywhere in onSection():

proshop.writeSectionDetails();

The RTA number can be set to use the Fusion 360 Tool Number or Tool Comment via post property.