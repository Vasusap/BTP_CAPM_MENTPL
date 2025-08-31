namespace cdsdatamodel.db;
using { plannedorder.db.transactional as transaction , plannedorder.db.masterdata as master }
 from './datamodel';

context cdsviews {



define view ![plannedOrderCDSview] as 
  select from transaction.plannedorder{
    key plndkey as ![plannedorder],
        mrparea as ![MRPArea],
        plant as ![Plant],
        material as ![Product],
        order_qty as ![Quantity],
        start_date,
        end_date,
        Firmed,
        P_capa.setup,
        P_capa.S_unit,
        P_capa.process,
        P_capa.P_unit,
        P_capa.teardown,
        P_capa.T_unit,
       

  }

  define view ![ComponentView] as select from master.components {
    key componentkey as ![Component],
    comp_items
  }

  define view ![capacity] as select from master.capacity{
    key capakey as ![Capacity],
    capadescr as ![Capacity_Descr],
    
  }


  
    
}



