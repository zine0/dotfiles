local autocmd = vim.api.nvim_create_autocmd

local onattach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.g.inlay_hints_visible = true
        vim.lsp.inlay_hint.enable(true, { bufnr })
    end
end

autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        for bufnr, _ in pairs(client.attached_buffers) do
            onattach(client, bufnr)
        end
    end,
})

vim.lsp.handlers["client/registerCapability"] = (function(overridden)
    return function(err, res, ctx)
        local result = overridden(err, res, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if not client then
            return
        end
        for bufnr, _ in pairs(client.attached_buffers) do
            onattach(client, bufnr)
        end
        return result
    end
end)(vim.lsp.handlers["client/registerCapability"])
