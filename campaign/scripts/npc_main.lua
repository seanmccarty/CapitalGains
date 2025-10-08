--
-- Please see the license.txt file included with this distribution for
-- attribution and copyright information.
--

local updateOriginal;

function onInit()
	updateOriginal = super.update;
	super.update = update;

	super.onInit();
end

function update()
	if updateOriginal then -- May have been deleted by another extension.
		updateOriginal();
	end

	local nodeRecord = getDatabaseNode();
	local bReadOnly = WindowManager.getReadOnlyState(nodeRecord);
	WindowManager.callSafeControlUpdate(self, "resources", bReadOnly);
end