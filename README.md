# Fusion360_ProShopERP_GCodeParsing
Insert this code into a Fusion 360 or HSM Post to output data that can be parsed by ProShop ERP

Copy/Paste next line immediately after post properties:

var proshop = new proshopErp();
  
Copy/Paste next line anywhere in onOpen():

proshop.writeOpNumber();
  
Copy/Paste next line anywhere in onSection():

proshop.writeSectionDetails();

The RTA number can be set to use the Fusion 360 Tool Number or Tool Comment via post property.