function validateBusForm(form)
{
	var number1=form.number1.value;
	var number2=form.number2.value;
	var number3=form.number3.value;
	var number4=form.number4.value;
	var seat=form.seat.value;
	var from=form.from.value;
	var to=form.to.value;
	var departure=form.departure.value;
	var arrival=form.arrival.value;
	
	if(number1.length==0)
	{
	alert("Enter Bus Number");
	form.number1.focus();
	return false;
	}
	
	var v='qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM';
	
	var e=0;
	while(e<number1.length)
		{
		if(v.indexOf(number1.charAt(e))==-1)
		{
		alert('Invalid Bus Number');
		form.number1.focus();
		return false;
		}
		e++;
		}
	
	if(number2.length==0)
	{
	alert("Enter Bus Number");
	form.number2.focus();
	return false;
	}
	
	if(number3.length==0)
	{
	alert("Enter Bus Number");
	form.number3.focus();
	return false;
	}
	
	e=0;
	while(e<number3.length)
		{
		if(v.indexOf(number3.charAt(e))==-1)
		{
		alert('Invalid Bus Number');
		form.number3.focus();
		return false;
		}
		e++;
		}
	
	if(number4.length==0)
	{
	alert("Enter Bus Number");
	form.number4.focus();
	return false;
	}
	
	if(seat.length==0)
	{
	alert("Enter Seat");
	form.seat.focus();
	return false;
	}
	
	if(from.length==0)
	{
	alert("Enter From");
	form.from.focus();
	return false;
	}
	
	e=0;
	while(e<from.length)
		{
		if(v.indexOf(from.charAt(e))==-1)
		{
		alert('Invalid From');
		form.from.focus();
		return false;
		}
		e++;
		}
	
	if(to.length==0)
	{
	alert("Enter To");
	form.to.focus();
	return false;
	}
	
	e=0;
	while(e<to.length)
		{
		if(v.indexOf(to.charAt(e))==-1)
		{
		alert('Invalid To');
		form.to.focus();
		return false;
		}
		e++;
		}
	
	if(departure.length==0)
	{
	alert("Enter Departure Time");
	form.departure.focus();
	return false;
	}
	
	if(arrival.length==0)
	{
	alert("Enter Arrival Time");
	form.arrival.focus();
	return false;
	}
	
	return true;
	}


function validateDriverForm(form)
{
	var firstName=form.firstName.value;
	var lastName=form.lastName.value;
	var contactNumber=form.contactNumber.value;
	var licenceNumber=form.licenceNumber.value;
	
	if(firstName.length==0)
		{
		alert('Enter First Name');
		form.firstName.focus();
		return false;
		}
	

	var v='qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM';
	
	var e=0;
	while(e<firstName.length)
		{
		if(v.indexOf(firstName.charAt(e))==-1)
		{
		alert('Invalid First Name');
		form.firstName.focus();
		return false;
		}
		e++;
		}
	
	if(lastName.length==0)
		{
		alert('Enter Last Name');
		form.lastName.focus();
		return false;
		}
	
	e=0;
	while(e<lastName.length)
		{
		if(v.indexOf(lastName.charAt(e))==-1)
		{
		alert('Invalid Last Name');
		form.lastName.focus();
		return false;
		}
		e++;
		}
	
	if(contactNumber.length==0)
	{
	alert('Enter Contact Number');
	form.contactNumber.focus();
	return false;
	}
		
		var n='1234567890';

		e=0;
		while(e<contactNumber.length)
			{
			if(n.indexOf(contactNumber.charAt(e))==-1)
			{
			alert('Please Enter Digits Only');
			form.contactNumber.focus();
			return false;
			}
			e++;
			}
		
	
	if(contactNumber.length!=10 )
	{
	alert('Enter Valid Contact Number');
	form.contactNumber.focus();
	return false;
	}
	
	if(licenceNumber.length==0)
		{
		alert('Enter Licence Number');
		form.licenceNumber.focus();
		return false;
		}

	return true;
}


function validateHotelForm(form)
{
	var hotelName=form.hotelName.value;
	var description=form.description.value;
	var contactNumber=form.contactNumber.value;
	var location=form.location.value;
	
	if(hotelName.length==0)
		{
			alert('Enter Hotel Name');
			form.hotelName.focus();
			return false;
		}
	
	var v='qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM';
	
	var e=0;
	while(e<hotelName.length)
		{
		if(v.indexOf(hotelName.charAt(e))==-1)
		{
		alert('Invalid Hotel Name');
		form.hotelName.focus();
		return false;
		}
		e++;
		}
	
	if(description.length==0)
		{
			alert('Enter Description Name');
			form.description.focus();
			return false;
		}
	
	e=0;
	while(e<description.length)
		{
		if(v.indexOf(description.charAt(e))==-1)
		{
		alert('Invalid Description');
		form.description.focus();
		return false;
		}
		e++;
		}
	
	
	if(contactNumber.length==0)
		{
			alert('Enter Contact Number');
			form.contactNumber.focus();
			return false;
		}
	
	var n='1234567890';

	e=0;
	while(e<contactNumber.length)
		{
		if(n.indexOf(contactNumber.charAt(e))==-1)
		{
		alert('Please Enter Digits Only');
		form.contactNumber.focus();
		return false;
		}
		e++;
		}
	

if(contactNumber.length!=10 )
{
alert('Enter Valid Contact Number');
form.contactNumber.focus();
return false;
}
	
	if(location.length==0)
		{
			alert('Enter Location');
			form.location.focus();
			return false;
		}
	
	e=0;
	while(e<location.length)
		{
		if(v.indexOf(location.charAt(e))==-1)
		{
		alert('Invalid Location');
		form.location.focus();
		return false;
		}
		e++;
		}	
	
return true;
}

function validatePackageForm(form)
{
	var place=form.place.value;
	var description=form.description.value;
	var from=form.dateFrom.value;
	var to=form.dateTo.value;
	var fare=form.fare.value;
	

	if(place.length==0)
		{
			alert('Enter Place');
			form.place.focus();
			return false;
		}
	
	var v='qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM';
	
	var e=0;
	while(e<place.length)
		{
		if(v.indexOf(place.charAt(e))==-1)
		{
		alert('Invalid Place');
		form.place.focus();
		return false;
		}
		e++;
		}
	
	if(description.length==0)
		{
			alert('Enter Description Name');
			form.description.focus();
			return false;
		}
	
	e=0;
	while(e<description.length)
		{
		if(v.indexOf(description.charAt(e))==-1)
		{
		alert('Invalid Description');
		form.description.focus();
		return false;
		}
		e++;
		}
	
	if(from.length==0)
	{
	alert("Enter From");
	form.dateFrom.focus();
	return false;
	}
	
	if(to.length==0)
	{
	alert("Enter To");
	form.dateTo.focus();
	return false;
	}
	
	if(fare.length==0)
		{
		alert('Enter Fare');
		form.fare.focus();
		return false;
		}
	return true;
}


function validatePassengerForm(form)
{
	var firstName=form.firstName.value;
	var lastName=form.lastName.value;
	var contactNumber=form.contactNumber.value;
	var emailId=form.emailId.value;
	var password=form.password.value;
	var confirmPassword=form.confirmPassword.value;
	var address=form.address.value;
	
	if(firstName.length==0)
		{
		alert('Enter First Name');
		form.firstName.focus();
		return false;
		}
	

	var v='qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM';
	
	var e=0;
	while(e<firstName.length)
		{
		if(v.indexOf(firstName.charAt(e))==-1)
		{
		alert('Invalid First Name');
		form.firstName.focus();
		return false;
		}
		e++;
		}
	
	if(lastName.length==0)
		{
		alert('Enter Last Name');
		form.lastName.focus();
		return false;
		}
	
	e=0;
	while(e<lastName.length)
		{
		if(v.indexOf(lastName.charAt(e))==-1)
		{
		alert('Invalid Last Name');
		form.lastName.focus();
		return false;
		}
		e++;
		}
	
	if(emailId.length==0)
		{
		alert('Enter EMail ID');
		form.emailId.focus();
		return false;
		}
	
	if(password.length==0)
		{
		alert('Enter Pasword');
		form.password.focus();
		return false;
		}
	
	
	if(confirmPassword.length==0)
		{
		alert('Enter Confirm Pasword');
		form.confirmPassword.focus();
		return false;
		}
	
	if(password!=confirmPassword)
		{
			alert('Both passwords are different');
			form.password.focus();
			return false;	
		}

	if(address.length==0)
		{
		alert('Enter Address');
		form.address.focus();
		return false;
		}
		
	if(contactNumber.length==0)
		{
		alert('Enter Contact Number');
		form.contactNumber.focus();
		return false;
		}
	
	var n='1234567890';

	e=0;
	while(e<contactNumber.length)
		{
		if(n.indexOf(contactNumber.charAt(e))==-1)
		{
		alert('Please Enter Digits Only');
		form.contactNumber.focus();
		return false;
		}
		e++;
		}
	

if(contactNumber.length!=10 )
{
alert('Enter Valid Contact Number');
form.contactNumber.focus();
return false;
}
	
	return true;	
}


function validateUserForm(form)
{
		var userName=form.userName.value;
		var password=form.password.value;
		var confirmPassword=form.confirmPassword.value;
		
		if(userName.length==0)
			{
			alert('Enter Username');
			form.userName.focus();
			return false;
			}
		


		var v='qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
		
		var e=0;
		while(e<userName.length)
			{
			if(v.indexOf(userName.charAt(e))==-1)
			{
			alert('Invalid Username');
			form.userName.focus();
			return false;
			}
			e++;
			}

		
		if(password.length==0)
		{
		alert('Enter Pasword');
		form.password.focus();
		return false;
		}
	
	
	if(confirmPassword.length==0)
		{
		alert('Enter Confirm Pasword');
		form.confirmPassword.focus();
		return false;
		}
	
	if(password!=confirmPassword)
		{
			alert('Both passwords are different');
			form.password.focus();
			return false;	
		}

}


function validateFindBusForm(form)
{
	
	var from=form.from.value;
	var to=form.to.value;
	var date=form.date.value; 
	var passenger=form.person.value;
	var returnDate=form.returnDate.value;
	var journeyType=form.journey.value;
	
	if(from.length==0)
	{
	alert("Enter From");
	form.from.focus();
	return false;
	}
	

	var v='qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
	
	var e=0;
	while(e<from.length)
		{
		if(v.indexOf(from.charAt(e))==-1)
		{
		alert('Invalid From');
		form.from.focus();
		return false;
		}
		e++;
		}
	
	if(to.length==0)
	{
	alert("Enter To");
	form.to.focus();
	return false;
	}
	
	e=0;
	while(e<to.length)
		{
		if(v.indexOf(to.charAt(e))==-1)
		{
		alert('Invalid To');
		form.to.focus();
		return false;
		}
		e++;
		}
	
	if(passenger.length==0)
	{
	alert("Enter Passenger");
	form.person.focus();
	return false;
	}

	
	if(date.length==0)
	{
		alert("Enter Date");
		form.date.focus();
		return false;
		}
	
	var d=new Date();
	var day=""+d.getDate();
	var month=""+(d.getMonth()+1);
	var year=d.getFullYear();
	
	if(day.length==1)
		{
			day="0"+day;
		}
	
	if(month.length==1)
		{
			month="0"+month;
		}
	
	var curDate=year+"-"+month+"-"+day;
	
	if(date<curDate )
		{
			alert('Please Enter Date After '+curDate);
			return false;
		}
	
	
	if(journeyType=='return')
	{
		if(returnDate.length==0)
		{
		alert("Enter Return Date");
		form.returnDate.focus();
		return false;
		}
		
		
		if(date>returnDate)
			{
				alert("Return Date must be greater than Date");
				return false;
			}
	}
	
	return true;
}

function validateAdminLoginForm(form)
{
	var userName=form.userName.value;
	var password=form.password.value;
	
	if(userName.length==0)
	{
	alert('Enter Username');
	form.userName.focus();
	return false;
	}

var v='qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';

var e=0;
while(e<userName.length)
	{
	if(v.indexOf(userName.charAt(e))==-1)
	{
	alert('Invalid Username');
	form.userName.focus();
	return false;
	}
	e++;
	}


if(password.length==0)
{
alert('Enter Password');
form.password.focus();
return false;
}

return true;
}


function validateFindHotelForm(form)
{
	var location=form.location.value;
	
	if(location.length==0)
		{
			alert("Enter Location");
			form.location.focus();
			return false;
		}
	
	var v='qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM ';

	var e=0;
	while(e<location.length)
		{
		if(v.indexOf(location.charAt(e))==-1)
		{
		alert('Invalid Location');
		form.location.focus();
		return false;
		}
		e++;
		}
return true;
}


function validatePackageForm(form)
{
var passenger=form.passenger.value;	

if(passenger.length==0)
{
alert("Enter Passenger");
form.passenger.focus();
return false;
}

}

function validateChangePasswordForm(form)
{
	var password=form.password.value;
	var confirmPassword=form.confirmPassword.value;
	
	if(password.length==0)
	{
	alert('Enter Pasword');
	form.password.focus();
	return false;
	}


if(confirmPassword.length==0)
	{
	alert('Enter Confirm Pasword');
	form.confirmPassword.focus();
	return false;
	}

if(password!=confirmPassword)
	{
		alert('Both passwords are different');
		form.password.focus();
		return false;	
	}

}