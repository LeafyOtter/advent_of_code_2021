import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

/*
//	Part 1;
class SonarSweep {
	public static void main(String[] args) {
		if (args.length == 0) {
			System.out.println("Error - expected input file path");
			System.exit(1);
		}
		int precedent, current, count;
		precedent = current = count = 0;
		try {
			File myFile = new File(args[0]);
			Scanner myReader = new Scanner(myFile);
			while (myReader.hasNextLine()) {
				current = Integer.parseInt(myReader.nextLine());
				if (current > precedent && precedent != 0)
					count++;
				precedent = current;
				}
			System.out.println(count);
			myReader.close();		
		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}
	}
}
*/

//	Part 2;
class SonarSweep {
	public static void main(String[] args) {
		if (args.length == 0) {
			System.out.println("Error - expected input file path");
			System.exit(1);
		}
		int n, n1, n2, n3, count;
		n = n1 = n2 = n3 = count = 0;
		try {
			File myFile = new File(args[0]);
			Scanner myReader = new Scanner(myFile);
			while (myReader.hasNextLine()) {
				n3 = Integer.parseInt(myReader.nextLine());
				if (n != 0 && n3 > n){
					count++;
				}
				n = n1;
				n1 = n2;
				n2 = n3;
			}
			System.out.println(count);
			myReader.close();		
		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}
	}
}
