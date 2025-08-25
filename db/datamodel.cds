namespace plannedorder.db;
using { local.commons as local} from './commons';
using { managed  } from '@sap/cds/common';


context masterdata {

    entity material :managed {
       key matkey : local.key_val;
       matdescr : local.descr;
       unit: local.unit;
        
    }
    entity capacity:managed {
      key capakey: local.key_val;
      capadescr: local.descr;
      unit:local.unit;   
      setup:Int16;  
      S_unit:local.unit;
      process:Int16;
      P_unit:local.unit; 
      teardown:Int16;
      T_unit:local.unit; 
    }
    entity components {
      key componentkey : local.key_val;
      comp_items : Association to many material on comp_items.matkey = $self.componentkey
    }
    
}
context transactional {

    entity plannedorder  {
       key plndkey : local.key_val;
        componentkey:local.key_val;
        capakey: local.key_val;
        plant:String(4);
        mrparea:String(4);
        material: Association to  masterdata.material;
        component: Association to  masterdata.components ;
        capacity:Association to one masterdata.capacity;
        
        order_qty:Int32;
        start_date : Date;
        end_date: Date;
        Firmed:String(1);
        P_compon: Composition of many masterdata.components on P_compon.componentkey = $self.componentkey;
        P_capa : Composition of many masterdata.capacity on P_capa.capakey = $self.capakey;
        
    }
    
}

