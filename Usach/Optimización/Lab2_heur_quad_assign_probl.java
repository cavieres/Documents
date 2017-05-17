public class Lab2_heur_quad_assign_probl {
	public static void main(String [] args)
	{
		int[][] flujos = new int[][]{
			{0, 3, 0, 2},
			{3, 0, 0, 1},
			{0, 0, 0, 4},
			{2, 1, 4, 0}
		};
		
		int [][] distancias = new int[][] {
			{0, 22, 53, 0},
			{22, 0, 40, 0},
			{53, 40, 0, 55},
			{0, 0, 55, 0}
		};
				
		// Ubicaciones dispuestas inicialmente en instalaciones.
		int instalaciones[] = {1, 2, 3, 4};
		
		
		System.out.println("hola");
	}
	
	private int GetCostoSolucion(int instalaciones[]) {
		int costoSolucion = 0;
		return costoSolucion;
	}
}