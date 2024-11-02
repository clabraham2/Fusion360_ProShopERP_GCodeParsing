/* ProShop G-Code Parse Add-in */

function proshopErp() {

  //Copy/Paste next line immediately after post properties without leading slashes.
  //var proshop = new proshopErp();

  //Copy/Paste next line anywhere in onOpen() without leading slashes.
  //proshop.writeOpNumber();

  //Copy/Paste next line anywhere in onOpen(), after proshop.writeOpNumber(), without leading slashes.
  //proshop.writeToolDetails();

  //Copy/Paste next line anywhere in onSection() without leading slashes.
  //proshop.writeSectionDetails();

  //Copy/Paste next 3 lines before the post property definition to create a ProShop ERP group. This is optional.
  // groupDefinitions = {
  //   proShopERP: {title: "ProShop ERP", description: "ProShop ERP", collapsed:true, order:70}
  // }

  this.init = function() {
    properties["_useProshopGCodeParsing"] = {title:"ProShop ERP Sequence Detail", description:"Include information that can be parsed by ProShop ERP to fill in sequence detail.", group:"proShopERP", type:"boolean", value:true, scope:"post"};
    properties["workOrderNumber"] = {title:"ProShop ERP Work Order Number", description:"The work order for the part routing in ProShop ERP.", group:"proShopERP", type:"string", value:"", scope:"post"};
    properties["operationNumber"] = {title:"ProShop ERP Operation Number", description:"The operation number for the part routing in ProShop ERP.", group:"proShopERP", type:"integer", value:50, scope:"post"};
    properties["partNumber"] = {title:"ProShop ERP Part Number", description:"The part number for the part routing in ProShop ERP.", group:"proShopERP", type:"string", value:"", scope:"post"};
    properties["rtaNumberSource"] = {title:"RTA Number Source", description:"Choose Tool Field used for Proshop RTA Number.", group:"proShopERP", type:"enum", values:[{title:"Tool Number", id:"toolNumber"},{title:"Tool Comment", id:"toolComment"}], value:"toolNumber", scope:"post"};
    properties["detailFormat"] = {title:"Detail Format", description:"Choose Tool List or Sequence List.", group:"proShopERP", type:"enum", values:[{title:"Tool List", id:"toolList"},{title:"Sequence List", id:"sequenceList"}], value:"toolList", scope:"post"};
  }
  this.init()
    
  this.writeOpNumber = function() {
    if (getProperty('_useProshopGCodeParsing')) {
        writeComment(" * OPERATION NUMBER = "+(getProperty("operationNumber")));
    }
  };

  this.writeToolDetails = function() {
    if (getProperty('_useProshopGCodeParsing') && getProperty('detailFormat') == 'toolList') {
      var toolErpLengthFormat = createFormat({decimals:(unit == MM ? 1 : 2), forceDecimal:true, trim:false});
      var tools = getToolTable();
      if (tools.getNumberOfTools() > 0) {
        writeln('');
        writeComment("ProShop ERP Tool Details")
        for (var i = 0; i < tools.getNumberOfTools(); ++i) {
          var tool = tools.getTool(i);
          writeComment(" * RTA NUMBER = "+ getRtaSource(tool));
          writeComment(" * OUT OF HOLDER LGTH = "+toolErpLengthFormat.format(tool.bodyLength));
        }
        writeln('');
      }
    }
  };
  
  this.writeSectionDetails = function() {
    if (getProperty('_useProshopGCodeParsing') && getProperty('detailFormat') == 'sequenceList') {
      var toolErpLengthFormat = createFormat({decimals:(unit == MM ? 1 : 2), forceDecimal:true, trim:false});
      writeComment(" * RTA NUMBER = "+ getRtaSource(tool));
      writeComment(" * SEQ DESC = "+sequenceNumber + " " + getParameter("operation-comment"));
      writeComment(" * OUT OF HOLDER LGTH = "+toolErpLengthFormat.format(tool.bodyLength));
    }
  };

  getRtaSource = function(tool) {
    switch (getProperty('rtaNumberSource')) {
      case 'toolNumber':
        return tool.number;
      case 'toolComment':
        return tool.comment;
    }
  }
}
  
/* End ProShop G-Code Parse Add-in */