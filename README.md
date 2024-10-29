# Fusion360_ProShopERP_GCodeParsing
Insert the code from Fusion360_ProShopERP_GCodeParsing.cps at the end a Fusion 360 or HSM Post to output data that can be parsed by ProShop ERP to populate sequence details for a part operation.

The output can be a fully detailed list of all toolpath operations or a simple list of tools used. While the full operation list is ideal, ProShop displays each use of a tool in each CAM operation as a discrete instance and the list becomes unnecessarily large. "Tool List" is the recommended mode for now.

Copy/Paste next line immediately after the post properties.
  
var proshop = new proshopErp();

Copy/Paste next line anywhere in onOpen().

proshop.writeOpNumber();

Copy/Paste next line anywhere in onOpen(), after proshop.writeOpNumber().
proshop.writeToolDetails();

Copy/Paste next line anywhere in onSection().

proshop.writeSectionDetails();

Copy/Paste next 3 lines before the post property definition to create a ProShop ERP group. This is optional.

groupDefinitions = {
    proShopERP: {title: "ProShop ERP", description: "ProShop ERP", collapsed:true, order:70}
}