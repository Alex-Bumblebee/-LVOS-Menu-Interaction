require "resources/mysql-async/lib/MySQL"

---------------------------------- FUNCTION ---------------------------------

-- FR -- Fonction : Récupère le travail du joueur
-- FR -- Paramètre(s) : player = ID du joueur
---------------------------------------------------------
-- EN -- Function : Get Job User
-- EN -- Param(s) : player = ID Player
function whereIsJob(player)
--MySQL.Async.fetchAll("SELECT job FROM users WHERE identifier = @identifier", {['@identifier'] = player}, function(result)
--	return result[1].job
--end)
  return MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", {['@identifier'] = player})
end

---------------------------------- EVENEMENT ---------------------------------

-- FR -- Evenement : Récupère le travail du joueur
-- FR -- Paramètre(s) : info = Résultat de la requête (Job)
---------------------------------------------------------
-- EN -- Evenement : Get Job User
-- EN -- Param(s) : info = Request result (Job)
RegisterServerEvent('menuint:getInfos')
AddEventHandler('menuint:getInfos', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
        -- jobuser = user.job
        whereIsJob(user.identifier)
        TriggerClientEvent("int:getInfos", source, jobuser)
  end)
end)

