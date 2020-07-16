package imd0412.drugreminder;

import java.util.ArrayList;
import java.util.List;

public class DrugReminderImpl implements IReminder {
	
public static String shiftDate(String schedule, int daysToShift) {
	

	int[] split;
	split = splitDate(schedule);
	
	int startDay = split[0];
	//System.out.println(split[0]);
	int startMonth = split[1];
	int startYear = split[2];
	
	checkDateCase(startDay,startMonth,startYear); //verifica se a data é válida no calendário
	
	int endDay = 0;
	int endMonth = 0;
	int endYear = 0;

	int yearIncrement=0;
	int dayIncrement=0;
	int monthIncrement=0;
	char casoMes = checkMonthCase(startMonth); // verifica o caso especial(se 31 dias, FEV bissexto ou não, 30 dias
	int modular = 0;
	
	switch(casoMes) {
	case 'a':
		if(checkLeapYear(startYear)) {
			modular = 29; //se é bissexto, tem 29 dias
		}else {
			modular = 28; //se NÃO é bissexto
		}
		dayIncrement = (startDay + daysToShift) % modular;
		
		if(dayIncrement<startDay && dayIncrement != 0) {
			monthIncrement++;
		}
		if(dayIncrement ==0) {
			endMonth = startMonth;
			endDay = startDay + daysToShift;
		}else {
			endMonth = (startMonth + monthIncrement) % 12;
			endDay = dayIncrement;
		}
		if(endMonth == 0) {
			endMonth = startMonth;
		}	
		endYear = startYear;
		break;
	
	case 'b':
		/*---------------CASO MÊS 31 DIAS------------------*/	
		dayIncrement = (startDay + daysToShift) % 31;
		
		if(dayIncrement<startDay && dayIncrement != 0) {
			monthIncrement++;
		}
		if(dayIncrement ==0) {
			endMonth = startMonth;
			endDay = startDay + daysToShift;
		}else {
			endMonth = (startMonth + monthIncrement) % 12;
			endDay = dayIncrement;
		}
		if(endMonth == 0) {
			endMonth = startMonth;
		}	
		endYear = startYear;
		break;
	case 'c':
		/*---------CASO MÊS 12 DEZEMBRO (31 DIAS)----(SHIFT 1 ANO)-----*/	
		dayIncrement = (startDay + daysToShift) % 31;
		
			if(dayIncrement<startDay && dayIncrement != 0) {
				monthIncrement++;
				yearIncrement++;
			}
			if(dayIncrement ==0) {
				endMonth = startMonth;
				endDay = startDay + daysToShift;
			}else {
				endMonth = (startMonth + monthIncrement) % 12;
				endDay = dayIncrement;
			}
			if(endMonth == 0) {
				endMonth = startMonth;
			}	
			endYear = startYear + yearIncrement;
			break;
		/*---------------------------------------------------------------*/	
	case 'd':
		/*------------------Caso mês de 30 dias--------------------------*/
		dayIncrement = (startDay + daysToShift) % 30;
		
		if(dayIncrement<startDay && dayIncrement != 0) {
			monthIncrement++;
		}
		if(dayIncrement ==0) {
			endMonth = startMonth;
			endDay = startDay + daysToShift;
		}else {
			endMonth = (startMonth + monthIncrement) % 12;
			endDay = dayIncrement;
		}
		if(endMonth == 0) {
			endMonth = startMonth;
		}	
		endYear = startYear;
		break;
	}
		String endDayString;
		String endMonthString;
		String endYearString = Integer.toString(endYear);
		if(endDay<10) {endDayString ="0" + Integer.toString(endDay);}else {endDayString = Integer.toString(endDay);}
		if(endMonth<10) {endMonthString ="0" + Integer.toString(endMonth);}else {endMonthString = Integer.toString(endMonth);}
		
		return endDayString + "/" + endMonthString + "/"+ endYearString;
		
}
public static boolean checkLeapYear(int year) {
	// se o ano for maior que 400
    if(year % 400 == 0){
        //System.out.println(year + " é bissexto.");
        return true;
    // se o ano for menor que 400
    } else if((year % 4 == 0) && (year % 100 != 0)){
        //System.out.println(year + " é bissexto.");
        return true;
    } else{
        //System.out.println(year + " não é bissexto");
        return false;
    }

}
public static char checkMonthCase(int month) {

	if(month >0 && month<= 12 ) {
		if(month == 2) {
			//System.out.println("É FEVEREIRO!");
			return 'a';
		}else {
			if(month ==1 || month==3 || month == 5 || month == 7 || month == 8 || month == 10) {
				//System.out.println("Esse mês é de 31 dias!");
				return 'b';
			}else {
				if(month==12) {
					//System.out.println("Esse mês é dezembro!");
					return 'c';
				}else {
					//System.out.println("Esse mês é de 30 dias!");
					return 'd';
				}
			}
		}
	}else {
		throw new IllegalArgumentException("Mês Inválido");
	}
	
}
public static void checkDateCase(int day, int month, int year) {
	char casoMes = checkMonthCase(month);
	boolean isLeapYear = checkLeapYear(year);
	
	if(year<2018) {
		throw new IllegalArgumentException("Inserir Data válida a partir de 01/01/2018!");
	}
	
	if(day<0 || day>31) {
		throw new IllegalArgumentException("Dia < 0 OU Dia > 31"); 
	}else {
		if(casoMes =='a') {
			if(isLeapYear && day<=29) {
				//System.out.println("Fevereiro bissexto, dia valido! ");
			}else {
				if(day<29) {
					//System.out.println("Fevereiro nao bissexto ");
				}else {
					throw new IllegalArgumentException("Dia não existe no calendário!"); 
				}
			}
		}
		if(casoMes =='b') { //mês de 31 dias
			//FAZER NADA, pois já está coberto no primeiro if :)
		}
		if(casoMes == 'c') { //dezembro, caso especial SHIFT_YEAR
			// idem anterior. Dezembro tem 31 dias :)
		}
		if(casoMes == 'd' && day>30 ) { // mes de 30 dias
			throw new IllegalArgumentException("Dia não existe no calendário!"); 
		}
	}
	
}
public static int[] splitSchedule(String schedule) {
	
	String[] parts = schedule.split(" ");
	String date = parts[0];
	String hour = parts[1];
	
	String[] partsFromDate = date.split("/");
	int dia = Integer.parseInt(partsFromDate[0]);
	int mes = Integer.parseInt(partsFromDate[1]);
	int ano = Integer.parseInt(partsFromDate[2]);

	String[] partsFromHour = hour.split(":");
	int hora = Integer.parseInt(partsFromHour[0]);
	int minuto = Integer.parseInt(partsFromHour[1]);

	int[] lista = {dia,mes,ano,hora, minuto};
	return lista;
}
public static int[] splitDate(String schedule) {
	
	String[] parts = schedule.split(" ");
	String date = parts[0];
	
	String[] partsFromDate = date.split("/");
	int dia = Integer.parseInt(partsFromDate[0]);
	int mes = Integer.parseInt(partsFromDate[1]);
	int ano = Integer.parseInt(partsFromDate[2]);

//		String[] partsFromHour = hour.split(":");
//		int hora = Integer.parseInt(partsFromHour[0]);
//		int minuto = Integer.parseInt(partsFromHour[1]);

	int[] lista = {dia,mes,ano};
	return lista;
}
public static int convertFrequency(Frequency frequency) {
	int temp = 0;
	switch(frequency) {
		case EIGHT_HOURS:
			temp = 8;
			break;
		case SIX_HOURS:
			temp = 6;
			break;
		case TWELVE_HOURS:
			temp = 12;
			break;
		case TWENTYFOUR_HOURS:
			temp = 24;
			break;
		default:
			break;
	}
	return temp;
}
public static void checkRegexPattern(String schedule) {
		String pattern = "[0-9]{2}/[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2}"; //expressão Regular conforme regra de negócio
		if(!schedule.matches(pattern)) {
			throw new IllegalArgumentException("Data/hora informados fora do padrão 'dd/mm/aaaa HH:mm'.");
		}
	}
	
public List<String> createReminders(String startTime, Frequency frequency,
			Integer duration) {
		checkRegexPattern(startTime); //Verifica se a entrada está no modelo "dd/MM/aaaa HH:mm"
		if(duration>30) {throw new IllegalArgumentException("Duracao do Tratamento Informada eh > 30 dias");}
		
		List<String> list = new ArrayList<String>();
		
		int[] split = splitSchedule(startTime);
		int startHour = split[3];
		int endMinute = split[4]; //pelas regras de negócio, a frequencia só altera as horas, portanto os minutos prevalecem

		int previousHour;
		int nextHour = startHour;
		int freq = convertFrequency(frequency); //converte o tipo Frequency para o valor inteiro correspondente
		
		String actualDay = shiftDate(startTime,0);
		String nextDay = shiftDate(startTime,0);
		String subYear = null;
		String subMonth = null;
		
		String nextHourString = null;
		String endMinuteString = null;

		previousHour = startHour;
		while(duration>0) {
			subMonth = actualDay.substring(0,6);
			subYear = actualDay.substring(8,10);//salva apenas os dois ultimos digitos do ano, conforme regra de negócio
			
			if(nextHour<10) {nextHourString ="0" + Integer.toString(nextHour);}else {nextHourString = Integer.toString(nextHour);}
			if(endMinute<10) {endMinuteString ="0" + Integer.toString(endMinute);}else {endMinuteString = Integer.toString(endMinute);}
			
			list.add(""+subMonth+subYear+" "+nextHourString+":"+endMinuteString);
			nextHour = (previousHour + freq) % 24;
			
			if(nextHour<previousHour) {
				nextDay = shiftDate(actualDay, 1);
				duration--;
			}else {
				if(nextHour == previousHour) {
					nextDay = shiftDate(actualDay, 1);
					duration--;
				}
			}
			actualDay = nextDay;
			previousHour = nextHour;
		}
		
		return list;

	}

}
