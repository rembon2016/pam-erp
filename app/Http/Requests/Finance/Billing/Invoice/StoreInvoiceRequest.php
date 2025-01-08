<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\Billing\Invoice;

use Illuminate\Foundation\Http\FormRequest;

final class StoreInvoiceRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'invoice_date' => 'required|date',
            'invoice_due_date' => 'required|date',
            'customer_billing_id' => 'nullable',
            'chw' => 'nullable',
            'revenue_recognition' => 'nullable',
            'date_revenue_recognizition' => 'nullable|date',
            'data' => 'nullable|array',
            'total' => 'nullable|numeric|min:0',
            'description' => 'nullable|string',
        ];
    }

    public function attributes(): array
    {
        return [
            'invoice_date' => 'Invoice Date',
            'invoice_due_date' => 'Invoice Due Date',
            'customer_billing_id' => 'Billing Customer',
            'chw' => 'Chargeable Weight',
            'revenue_recognition' => 'Deferred Revenue Recognizition',
            'date_revenue_recognition' => 'Date of Revenue Recognizition',
            'total' => 'Total Invoices Amount',
            'description' => 'Description',
            'data' => 'Invoice Charges',
        ];
    }
}
