@if(!@$agent_contract->id)
    @include('pages.finance.master-data.agent-contract.pieces.create.service-form')
@else
    @include('pages.finance.master-data.agent-contract.pieces.edit.service-form')
@endif
