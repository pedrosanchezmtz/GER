package integra.globalgas.com.esb.ess.bbva;

import com.oracle.xmlns.scheduler.ESSWebService;
import com.oracle.xmlns.scheduler.ESSWebService_Service;


import com.oracle.xmlns.scheduler.types.AsyncStatus;

import oracle.as.scheduler.AsyncExecutable;
import oracle.as.scheduler.Cancellable;
import oracle.as.scheduler.ExecutionCancelledException;
import oracle.as.scheduler.ExecutionErrorException;
import oracle.as.scheduler.ExecutionPausedException;
import oracle.as.scheduler.ExecutionWarningException;
import oracle.as.scheduler.RequestExecutionContext;
import oracle.as.scheduler.RequestParameters;
import integra.globalgas.com.esb.ess.util.ProcessSchedulerMessage;



public class essIntegraGlobalGasMessageManager implements AsyncExecutable, Cancellable
{
  public void execute(RequestExecutionContext ctx, RequestParameters params)
    throws ExecutionErrorException, ExecutionWarningException,
           ExecutionCancelledException, ExecutionPausedException
  {
      ProcessSchedulerMessage process;
        try {
            process = ProcessSchedulerMessage.class.newInstance();
            System.err.println();
            System.err.println("-----------------------------------------------");
            System.err.println("-----------------------------------------------");
            System.err.println("Queue: "+(String)params.getValue("submit.process"));
            System.err.println("-----------------------------------------------");
            System.err.println("-----------------------------------------------");
            
            /*
            try {
                        System.err.println("Iniciando ---------- WS BSS");
                        ESSWebService_Service eSSWebService_Service = new ESSWebService_Service();
                        ESSWebService eSSWebService = eSSWebService_Service.getSchedulerServiceImplPort();
                        eSSWebService.setAsyncRequestStatus(ctx.toString(), AsyncStatus.SUCCESS, "Finalize ..");
                        System.err.println("Finalizando ---------- WS BSS");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

            */
            
            //
        ///    ESSWebService_Service eSSWebService_Service = new ESSWebService_Service();
         //   ESSWebService eSSWebService = eSSWebService_Service.getSchedulerServiceImplPort();
            
            //
            
          //  process.sendMessage("msg", (String)params.getValue("submit.process"));
          //  SchedulerServiceImplPortClient.publishAsyncStatus(ctx.toString(), "SUCCESS", "Scheduler process DP BBVA being processed");
            return;
        } catch (Exception e) {
         //   SchedulerServiceImplPortClient.publishAsyncStatus(ctx.toString(), "ERROR", e.getMessage());
            e.printStackTrace();
        }
        
      
  }

  public void cancel()
  {
     
      return;
  }
  

    
    
}
