local workarrounds = require "utils.workarrounds"

---@type vim.lsp.Config
return {
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = "vtsls" }
      if #clients == 0 then
        local msg = "Could not find `vtsls` lsp client, `vue_ls` would not work without it."
        vim.notify(msg, vim.log.levels.ERROR)
        return
      end

      local ts_client = clients[1]
      local param = unpack(result)
      local id, command, payload = unpack(param)

      ts_client:exec_cmd({
        title = "vue_request_forward",
        command = "typescript.tsserverRequest",
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
        local body = r and r.body or nil
        local response_data = { { id, body } }
        ---@diagnostic disable-next-line: param-type-mismatch
        client:notify("tsserver/response", response_data)
      end)
    end
  end,
}
