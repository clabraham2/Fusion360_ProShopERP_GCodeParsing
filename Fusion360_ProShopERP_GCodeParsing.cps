/* ProShop G-Code Parse Add-in */

function proshopErp() {

    //Copy/Paste next line immediately after post properties without leading slashes.
    //var proshop = new proshopErp();
  
    //Copy/Paste next line anywhere in onOpen() without leading slashes.
    //proshop.writeOpNumber();
  
    //Copy/Paste next line anywhere in onSection() without leading slashes.
    //proshop.writeSectionDetails();
  
    this.init = function() {
      properties["_useProshopGCodeParsing"] = {title:"ProShop ERP Sequence Detail", description:"Include information that can be parsed by ProShop ERP to fill in sequence detail.", group:"ProShop ERP", type:"boolean", value:true, scope:"post"};
      // properties["workOrderNumber"] = {title:"ProShop ERP Work Order Number", description:"The work order for the part routing in ProShop ERP.", group:"ProShop ERP", type:"string", value:"", scope:"post"};
      properties["operationNumber"] = {title:"ProShop ERP Operation Number", description:"The operation number for the part routing in ProShop ERP.", group:"ProShop ERP", type:"integer", value:50, scope:"post"};
      // properties["partNumber"] = {title:"ProShop ERP Part Number", description:"The part number for the part routing in ProShop ERP.", group:"ProShop ERP", type:"string", value:"", scope:"post"};
      properties["rtaNumberSource"] = {title:"RTA Number Source", description:"Choose Tool Field used for Proshop RTA Number.", group:"ProShop ERP", type:"enum", values:[{title:"Tool Number", id:"toolNumber"},{title:"Tool Comment", id:"toolComment"}], value:"toolNumber", scope:"post"};
    }
    this.init()
      
    this.writeOpNumber = function() {
      if (properties._useProshopGCodeParsing) {
          writeComment(" * OPERATION NUMBER = "+(getProperty("operationNumber")));
      }
    };
    
    this.writeSectionDetails = function() {
      if (properties._useProshopGCodeParsing) {
          writeComment(" * RTA NUMBER = "+tool.number);
          writeComment(" * SEQ DESC = "+sequenceNumber + " " + comment);
          writeComment(" * OUT OF HOLDER LGTH = "+xyzFormat.format(tool.bodyLength));
      }
    };
  }
    
  /* End ProShop G-Code Parse Add-in */