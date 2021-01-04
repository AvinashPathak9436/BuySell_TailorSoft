function isEmpty(data)
{
	if(data.length==0)
		return false
		
		else
			return true
}


function checkLength(data)
{
	if(data.length<=8)
		return false
		
		else
			return true


}

function checkCombo(data)
{
	//alert(data)
	if(data=="default")
		return false
		
		else
			return true


}



function checkBoxRadioCheck(arr)
{
	flag=0;
//	alert(arr)
	
	
	for(var i=0;i<arr.length;i++)
		{
			if(arr[i].checked)
				{
				flag=1;
				break;
				}
		
		
		}
	
	
	if(flag==0)
		return false
		else
			return true


}



