-- Refreshing SQL connection string, pointing to server name, 
-- according to environment where script is processing.

IF (select @@SERVERNAME) = 'FITADPLAT02'
	UPDATE rbases SET stringco = 'V69xJtHbZx2rUbleD0EzjmttnQ+DdhkkazAhBeHTta5z23rlUYPrqAU85B5JsM8OXL6gDl8sm9ISz15Lo7/XrvED8BknW1qmMeK8ZMYFrqs=' WHERE Cliente = 'ADP ARG        ' AND idJdd = 'BASE0AR        '
--ELSE
	-- TODO: PUT appropiate connection string.

