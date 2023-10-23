package aspectos;

import contas.Conta;

public aspect Mensagens {
	
//	mais geral que os outros, pode ser chamado por qualquer objeto.
//	
//	 pointcut pcCreditar1(): 
//		 call(public * creditar(..));
//	
//	menos geral que o primeiro, apenas pode ser chamado por objetos do tipo conta.
//	 
//	 pointcut pcCreditar2(): 
//		 call(public * Conta.creditar(..));
//	
//	o mais especifico, apenas pode ser chamado por uma instancia especifica do metodo conta.
//	
//	pointcut pcCreditar3(Conta c): 
//		target(c) && call(public * creditar(..));

    pointcut pcCreditar(Conta c, double valor):
        target(c) && call(public void creditar(double)) && args(valor);
    
      
    before(Conta c, double valor): pcCreditar(c, valor) {
        System.out.println("Vou creditar!\n");
        System.out.println("Creditar valor: R$ " + valor);
    }

    
    Object around(Conta c, double valor): pcCreditar(c, valor) {
        System.out.println("Saldo Anterior: " + c.getSaldo());
        Object result = proceed(c, valor);
        System.out.println("Saldo Atual: " + c.getSaldo() + "\n");

        return result;
    }

}



